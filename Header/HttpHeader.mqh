//+------------------------------------------------------------------+
//| Include the file CJson class                                     |
//+------------------------------------------------------------------+
#include "../Utils/Json.mqh"
//+------------------------------------------------------------------+
//| class : CHttpHeader                                              |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CHttpHeader                                        |
//| Heritage    : No heritage                                        |
//| Description : Responsible for organizing and storing the headers |
//|               of a request.                                      |
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpHeader
  {
private:
   
   CJson             m_headers;
   
public:
                     CHttpHeader(void);
                    ~CHttpHeader(void);
   
   //--- Functions to manage headers
   void              Append(string key, string value);   // Adds a new header to the HTTP request or updates it if it already exists
   string            Get(string key);                    // Returns the value of a specific header, given its name.
   void              Remove(string key);                 // Removes a specific header.
   bool              Contains(string key);               // Checks whether a header with the specified key is present.
   void              Clear(void);                        // Removes all headers from the request.
   int               Count(void);                        // Returns the number of headers.
   
   //--- Auxiliary methods
   string            ToString(void);                     // Returns all headers in string format, ready to be sent in an HTTP request.
   bool              Parse(string headers);              // Converts a string containing headers (usually received in an HTTP response) into a format usable by the class.
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpHeader::CHttpHeader(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CHttpHeader::~CHttpHeader(void)
  {
  }
//+------------------------------------------------------------------+
//| Adds a new header to the HTTP request or updates it if it already|
//| exists                                                           |
//+------------------------------------------------------------------+
void CHttpHeader::Append(string key,string value)
  {
   m_headers[key] = value;
  }
//+------------------------------------------------------------------+
//| Returns the value of a specific header, given its name.          |
//+------------------------------------------------------------------+
string CHttpHeader::Get(string key)
  {
   return(m_headers[key].ToString());
  }
//+------------------------------------------------------------------+
//| Removes a specific header.                                       |
//+------------------------------------------------------------------+
void CHttpHeader::Remove(string key)
  {
   m_headers.Remove(key);
  }
//+------------------------------------------------------------------+
//| Checks whether a header with the specified key is present.       |
//+------------------------------------------------------------------+
bool CHttpHeader::Contains(string key)
  {
   return(m_headers.FindKey(key) != NULL);
  }
//+------------------------------------------------------------------+
//| Removes all headers from the request.                            |
//+------------------------------------------------------------------+
void CHttpHeader::Clear(void)
  {
   m_headers.Clear();
  }
//+------------------------------------------------------------------+
//| Returns the number of headers.                                   |
//+------------------------------------------------------------------+
int CHttpHeader::Count(void)
  {
   return(m_headers.Size());
  }
//+------------------------------------------------------------------+
//| Returns all headers in string format, ready to be sent in an HTTP|
//| request.                                                         |
//+------------------------------------------------------------------+
string CHttpHeader::ToString(void)
  {
   //--- String with the result
   string headers;
   
   //--- Get size
   int size = this.Count();
   for(int i=0;i<size;i++)
     {
      //--- Adds the header to the string in the format: "key: value"
      headers += m_headers[i].m_key + ": " + m_headers[i].ToString();
      
      //--- If it's not the last time it adds "\n" at the end of the string
      if(i != size -1)
        {
         headers += "\n";
        }
     }
   
   //--- Return result
   return(headers);
  }
//+------------------------------------------------------------------+
//| Converts a string containing headers (usually received in an HTTP|
//| response) into a format usable by the class.                     |
//+------------------------------------------------------------------+
bool CHttpHeader::Parse(string headers)
  {
   //--- Array to store the key value sets
   string params[];
   
   //--- Separate the string, using the "\n" character as a separator
   int size = StringSplit(headers,StringGetCharacter("\n",0),params);
   for(int i=0;i<size;i++)
     {
      //--- With the header separated using ": "
      int pos = StringFind(params[i],": ");
      if(pos >= 0)
        {
         //--- Get key and value
         string key = StringSubstr(params[i],0,pos);
         string value = StringSubstr(params[i],pos+2);
         
         //--- Clear value
         StringTrimRight(value);
         
         //--- Add in json
         this.Append(key,value);
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
