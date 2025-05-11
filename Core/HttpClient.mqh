//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "HttpRequest.mqh"
#include "HttpResponse.mqh"
#include "../Constants/HttpMethod.mqh"
#include "Interface/IHttpTransport.mqh"
#include "Interface/IHttpObserver.mqh"
#include "HttpTransport.mqh"
//+------------------------------------------------------------------+
//| class : CHttpClient                                              |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CHttpClient                                        |
//| Heritage    : No heritage                                        |
//| Description : Class responsible for linking the request and      |
//|               response object with the transport layer.          |
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpClient
  {
private:
   
   IHttpTransport    *m_transport;                       // Instance to store the transport implementation
   IHttpObserver     *m_observers[];                     // Array of observers
   
public:
                     CHttpClient(IHttpTransport *transport);
                     CHttpClient(void);
                    ~CHttpClient(void);
   
   //--- Observers
   void              RegisterObserver(IHttpObserver *observer);
   void              UnregisterObserver(IHttpObserver *observer);
   void              OnSendNotifyObservers(CHttpRequest *request);
   void              OnRecvNotifyObservers(CHttpResponse *response);
   
   //--- Basis function
   bool              Send(CHttpRequest &request, CHttpResponse &response);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpClient::CHttpClient(IHttpTransport *transport)
  {
   m_transport = transport;
  }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpClient::CHttpClient(void)
  {
   m_transport = new CHttpTransport();
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CHttpClient::~CHttpClient(void)
  {
   delete m_transport;
  }
//+------------------------------------------------------------------+
//| Add observer pointer to observer list                            |
//+------------------------------------------------------------------+
void CHttpClient::RegisterObserver(IHttpObserver *observer)
  {
   int size = ArraySize(m_observers);
   ArrayResize(m_observers,size+1);
   m_observers[size] = observer;
  }
//+------------------------------------------------------------------+
//| Remove observer pointer to observer list                         |
//+------------------------------------------------------------------+
void CHttpClient::UnregisterObserver(IHttpObserver *observer)
  {
   int size = ArraySize(m_observers);
   for(int i=0;i<size;i++)
     {
      if(GetPointer(m_observers[i]) == GetPointer(observer))
        {
         ArrayRemove(m_observers,i,1);
         break;
        }
     }
  }
//+------------------------------------------------------------------+
//| Notifies observers that a request has been made                  |
//+------------------------------------------------------------------+
void CHttpClient::OnSendNotifyObservers(CHttpRequest *request)
  {
   int size = ArraySize(m_observers);
   for(int i=0;i<size;i++)
     {
      m_observers[i].OnSend(request);
     }
  }
//+------------------------------------------------------------------+
//| Notifies observers that a response has been received             |
//+------------------------------------------------------------------+
void CHttpClient::OnRecvNotifyObservers(CHttpResponse *response)
  {
   int size = ArraySize(m_observers);
   for(int i=0;i<size;i++)
     {
      m_observers[i].OnRecv(response);
     }
  }
//+------------------------------------------------------------------+
//| Basis function                                                   |
//+------------------------------------------------------------------+
bool CHttpClient::Send(CHttpRequest &request, CHttpResponse &response)
  {
   //--- Request
   uchar body_request[];
   request.Body().ToBinaryArray(body_request);
   
   //--- Response
   uchar body_response[];
   string headers_response;
   
   //--- Notify observer of request
   this.OnSendNotifyObservers(GetPointer(request));
   
   //--- Send
   ulong start = GetMicrosecondCount();
   int status_code = m_transport.Request(request.Method().GetMethodName(),request.Url().GetFullUrl(),request.Header().ToString(),request.GetTimeout(),body_request,body_response,headers_response);
   ulong end = GetMicrosecondCount();
   
   //--- Notify observer of response
   this.OnRecvNotifyObservers(GetPointer(response));
   
   //--- Add data in Response
   response.Clear();
   response.SetDuration((end-start)/1000);
   response.StatusCode() = status_code;
   response.Body().AddBinary(body_response);
   response.Header().Parse(headers_response);
   
   //--- Return is success
   return(response.StatusCode().IsSuccess());
  }
//+------------------------------------------------------------------+