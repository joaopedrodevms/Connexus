//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "../Constants/HttpStatusCode.mqh"
#include "../Header/HttpBody.mqh"
#include "../Header/HttpHeader.mqh"
//+------------------------------------------------------------------+
//| class : CHttpResponse                                            |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CHttpResponse                                      |
//| Heritage    : No heritage                                        |
//| Description : gathers elements of an http response such as body, |
//|               header, status code and duration                   |
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpResponse
  {
private:
   
   CHttpHeader       *m_header;
   CHttpBody         *m_body;
   CHttpStatusCodes  *m_status_code;
   ulong              m_duration;

public:
                     CHttpResponse(void);
                    ~CHttpResponse(void);
   
   //--- HTTP
   CHttpHeader       *Header(void);                      // Get header object
   CHttpBody         *Body(void);                        // Get body object
   CHttpStatusCodes  *StatusCode(void);                  // Get status code object
   
   //--- Duration
   void              SetDuration(ulong duration);           // Set duration
   ulong             GetDuration(void);                     // Get duration
   
   //--- Auxiliary methods
   void              Clear(void);                        // Reset data
   string            ToString(void);                 // Format data
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpResponse::CHttpResponse(void)
  {
   m_header = new CHttpHeader();
   m_body = new CHttpBody();
   m_status_code = new CHttpStatusCodes();
   m_duration = 0; // Reset duration
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CHttpResponse::~CHttpResponse(void)
  {
   delete m_header;
   delete m_body;
   delete m_status_code;
  }
//+------------------------------------------------------------------+
//| Get header object                                                |
//+------------------------------------------------------------------+
CHttpHeader *CHttpResponse::Header(void)
  {
   return(GetPointer(m_header));
  }
//+------------------------------------------------------------------+
//| Get body object                                                  |
//+------------------------------------------------------------------+
CHttpBody *CHttpResponse::Body(void)
  {
   return(GetPointer(m_body));
  };
//+------------------------------------------------------------------+
//| Get status code object                                           |
//+------------------------------------------------------------------+
CHttpStatusCodes *CHttpResponse::StatusCode(void)
  {
   return(GetPointer(m_status_code));
  };
//+------------------------------------------------------------------+
//| Set duration                                                     |
//+------------------------------------------------------------------+
void CHttpResponse::SetDuration(ulong duration)
  {
   m_duration = duration;
  }
//+------------------------------------------------------------------+
//| Get duration                                                     |
//+------------------------------------------------------------------+
ulong CHttpResponse::GetDuration(void)
  {
   return(m_duration);
  }
//+------------------------------------------------------------------+
//| Reset data                                                       |
//+------------------------------------------------------------------+
void CHttpResponse::Clear(void)
  {
   m_header.Clear();
   m_body.Clear();
   m_status_code.SetStatusCode(HTTP_STATUS_URL_NOT_ALLOWED);
  }
//+------------------------------------------------------------------+
//| Format data                                                      |
//+------------------------------------------------------------------+
string CHttpResponse::ToString(void)
  {
   return(
      "HTTP Response:"+
    "\n---------------"+
    "\nStatus Code: "+m_status_code.GetStatusCodeMessage()+
    "\nDuration: "+IntegerToString(m_duration)+" ms"+
    "\n"+
    "\n---------------"+
    "\nHeaders:"+
    "\n"+m_header.ToString()+
    "\n---------------"+
    "\nBody:"+
    "\n"+m_body.ToString()+
    "\n---------------"
   );
  }
//+------------------------------------------------------------------+
