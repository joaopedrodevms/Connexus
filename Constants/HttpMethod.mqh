//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ENUM_HTTP_METHOD
  {
   HTTP_METHOD_NULL = 0,   // [0] Null
   HTTP_METHOD_CONNECT,    // [1] Connect
   HTTP_METHOD_DELETE,     // [2] Delete
   HTTP_METHOD_GET,        // [3] Get
   HTTP_METHOD_HEAD,       // [4] Head
   HTTP_METHOD_OPTION,     // [5] Option
   HTTP_METHOD_PATCH,      // [6] Patch
   HTTP_METHOD_POST,       // [7] Post
   HTTP_METHOD_PUT,        // [8] Put
   HTTP_METHOD_TRACE,      // [9] Trace
  };
//+------------------------------------------------------------------+
//| class : CHttpMethod                                              |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CHttpMethod                                        |
//| Heritage    : No heritage                                        |
//| Description : Saved http method.                                 |
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpMethod
  {
private:

   ENUM_HTTP_METHOD  m_method;                           // Stores the method that will be used

public:
                     CHttpMethod(void);
                    ~CHttpMethod(void);
   //--- Get and set
   void              operator=(ENUM_HTTP_METHOD method); // Defines the http method
   void              SetMethod(ENUM_HTTP_METHOD method); // Defines the http method
   bool              SetMethod(string method);           // Defines the http method
   ENUM_HTTP_METHOD  GetMethod(void);                    // Get http method
   string            GetMethodName(void);                // Get the name of the selected http method
   
   //--- Check method
   bool              IsConnect(void);                    // Check if method is connect
   bool              IsGet(void);                        // Check if method is get
   bool              IsPost(void);                       // Check if method is post
   bool              IsPut(void);                        // Check if method is put
   bool              IsDelete(void);                     // Check if method is delete
   bool              IsPatch(void);                      // Check if method is patch
   bool              IsHead(void);                       // Check if method is head
   bool              IsOption(void);                     // Check if method is option
   bool              IsTrace(void);                      // Check if method is trace
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpMethod::CHttpMethod(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CHttpMethod::~CHttpMethod(void)
  {
  }
//+------------------------------------------------------------------+
//|  Defines the http method                                         |
//+------------------------------------------------------------------+
void CHttpMethod::operator=(ENUM_HTTP_METHOD method)
  {
   m_method = method;
  }
//+------------------------------------------------------------------+
//|  Defines the http method                                         |
//+------------------------------------------------------------------+
void CHttpMethod::SetMethod(ENUM_HTTP_METHOD method)
  {
   m_method = method;
  }
//+------------------------------------------------------------------+
//|  Defines the http method                                         |
//+------------------------------------------------------------------+
bool CHttpMethod::SetMethod(string method)
  {
   string method_upper = method;
   StringToUpper(method_upper);
   if(method_upper == "CONNECT")
     {
      m_method = HTTP_METHOD_CONNECT;
      return(true);
     }
   else if(method_upper == "DELETE")
     {
      m_method = HTTP_METHOD_DELETE;
      return(true);
     }
   else if(method_upper == "GET")
     {
      m_method = HTTP_METHOD_GET;
      return(true);
     }
   else if(method_upper == "HEAD")
     {
      m_method = HTTP_METHOD_HEAD;
      return(true);
     }
   else if(method_upper == "OPTIONS")
     {
      m_method = HTTP_METHOD_OPTION;
      return(true);
     }
   else if(method_upper == "PATCH")
     {
      m_method = HTTP_METHOD_PATCH;
      return(true);
     }
   else if(method_upper == "POST")
     {
      m_method = HTTP_METHOD_POST;
      return(true);
     }
   else if(method_upper == "PUT")
     {
      m_method = HTTP_METHOD_PUT;
      return(true);
     }
   else if(method_upper == "TRACE")
     {
      m_method = HTTP_METHOD_TRACE;
      return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| Get http method                                                  |
//+------------------------------------------------------------------+
ENUM_HTTP_METHOD CHttpMethod::GetMethod(void)
  {
   return(m_method);
  }
//+------------------------------------------------------------------+
//| Get the description of the selected http method                  |
//+------------------------------------------------------------------+
string CHttpMethod::GetMethodName(void)
  {
   switch(m_method)
     {
      case HTTP_METHOD_CONNECT:
         return "CONNECT";
      case HTTP_METHOD_DELETE:
         return "DELETE";
      case HTTP_METHOD_GET:
         return "GET";
      case HTTP_METHOD_HEAD:
         return "HEAD";
      case HTTP_METHOD_OPTION:
         return "OPTIONS";
      case HTTP_METHOD_PATCH:
         return "PATCH";
      case HTTP_METHOD_POST:
         return "POST";
      case HTTP_METHOD_PUT:
         return "PUT";
      case HTTP_METHOD_TRACE:
         return "TRACE";

      default:
         return "Unknown HTTP Method";
     }
  }
//+------------------------------------------------------------------+
//| Check if method is connect                                       |
//+------------------------------------------------------------------+
bool CHttpMethod::IsConnect(void)
  {
   return(m_method == HTTP_METHOD_CONNECT);
  }
//+------------------------------------------------------------------+
//| Check if method is get                                           |
//+------------------------------------------------------------------+
bool CHttpMethod::IsGet(void)
  {
   return(m_method == HTTP_METHOD_GET);
  }
//+------------------------------------------------------------------+
//| Check if method is post                                          |
//+------------------------------------------------------------------+
bool CHttpMethod::IsPost(void)
  {
   return(m_method == HTTP_METHOD_POST);
  }
//+------------------------------------------------------------------+
//| Check if method is put                                           |
//+------------------------------------------------------------------+
bool CHttpMethod::IsPut(void)
  {
   return(m_method == HTTP_METHOD_PUT);
  }
//+------------------------------------------------------------------+
//| Check if method is delete                                        |
//+------------------------------------------------------------------+
bool CHttpMethod::IsDelete(void)
  {
   return(m_method == HTTP_METHOD_DELETE);
  }
//+------------------------------------------------------------------+
//| Check if method is patch                                         |
//+------------------------------------------------------------------+
bool CHttpMethod::IsPatch(void)
  {
   return(m_method == HTTP_METHOD_PATCH);
  }
//+------------------------------------------------------------------+
//| Check if method is head                                          |
//+------------------------------------------------------------------+
bool CHttpMethod::IsHead(void)
  {
   return(m_method == HTTP_METHOD_HEAD);
  }
//+------------------------------------------------------------------+
//| Check if method is option                                        |
//+------------------------------------------------------------------+
bool CHttpMethod::IsOption(void)
  {
   return(m_method == HTTP_METHOD_OPTION);
  }
//+------------------------------------------------------------------+
//| Check if method is trace                                         |
//+------------------------------------------------------------------+
bool CHttpMethod::IsTrace(void)
  {
   return(m_method == HTTP_METHOD_TRACE);
  }
//+------------------------------------------------------------------+
  