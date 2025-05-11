//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "../Utils/URL.mqh"
#include "../Header/HttpBody.mqh"
#include "../Header/HttpHeader.mqh"
#include "../Constants/HttpMethod.mqh"
//+------------------------------------------------------------------+
//| class : CHttpRequest                                             |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CHttpRequest                                       |
//| Heritage    : No heritage                                        |
//| Description : Gathers elements of an http request such as url,   |
//|               body, header, method and timeout                   |
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpRequest
  {
private:

   CURL              *m_url;
   CHttpBody         *m_body;
   CHttpHeader       *m_headers;
   CHttpMethod       *m_method;
   int               m_timeout;

public:
                     CHttpRequest(void);
                    ~CHttpRequest(void);

   //--- HTTP
   CURL              *Url(void);                         // Get url object
   CHttpBody         *Body(void);                        // Get body object
   CHttpHeader       *Header(void);                      // Get header object
   CHttpMethod       *Method(void);                      // Get method object
   
   //--- Timeout
   void              SetTimeout(int timeout);            // Set timeout
   int               GetTimeout(void);                   // Get timeout
   
   //--- Auxiliary methods
   void              Clear(void);                        // Reset data
   string            ToString(void);                     // Format data
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpRequest::CHttpRequest(void)
  {
   m_url = new CURL();
   m_body = new CHttpBody();
   m_headers = new CHttpHeader();
   m_method = new CHttpMethod();
   m_timeout = 5000; // Default timeout (5 seconds)
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CHttpRequest::~CHttpRequest(void)
  {
   delete m_url;
   delete m_body;
   delete m_headers;
   delete m_method;
  }
//+------------------------------------------------------------------+
//| Get url object                                                   |
//+------------------------------------------------------------------+
CURL *CHttpRequest::Url(void)
  {
   return(GetPointer(m_url));
  }
//+------------------------------------------------------------------+
//| Get body object                                                  |
//+------------------------------------------------------------------+
CHttpBody *CHttpRequest::Body(void)
  {
   return(GetPointer(m_body));
  }
//+------------------------------------------------------------------+
//| Get header object                                                |
//+------------------------------------------------------------------+
CHttpHeader *CHttpRequest::Header(void)
  {
   return(GetPointer(m_headers));
  }
//+------------------------------------------------------------------+
//| Get method object                                                |
//+------------------------------------------------------------------+
CHttpMethod *CHttpRequest::Method(void)
  {
   return(GetPointer(m_method));
  }
//+------------------------------------------------------------------+
//| Set timeout                                                      |
//+------------------------------------------------------------------+
void CHttpRequest::SetTimeout(int timeout)
  {
   m_timeout = timeout;
  }
//+------------------------------------------------------------------+
//| Get timeout                                                      |
//+------------------------------------------------------------------+
int CHttpRequest::GetTimeout(void)
  {
   return(m_timeout);
  }
//+------------------------------------------------------------------+
//| Reset data                                                       |
//+------------------------------------------------------------------+
void CHttpRequest::Clear(void)
  {
   m_url.Clear();
   m_body.Clear();
   m_headers.Clear();
   m_timeout = 5000;
  }
//+------------------------------------------------------------------+
//| Format data                                                      |
//+------------------------------------------------------------------+
string CHttpRequest::ToString(void)
  {
   return(
      "HTTP Request:"+
    "\n---------------"+
    "\nMethod: "+m_method.GetMethodName()+
    "\nURL: "+m_url.GetFullUrl()+
    "\n"+
    "\n---------------"+
    "\nHeaders:"+
    "\n"+m_headers.ToString()+
    "\n"+
    "\n---------------"+
    "\nBody:"+
    "\n"+m_body.ToString()+
    "\n---------------"
   );
  }
//+------------------------------------------------------------------+
