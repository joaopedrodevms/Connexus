//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+

#include "../Data/Json.mqh"
#include "Interfaces/IHttpHeaders.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpHeaders : public IHttpHeaders
  {
private:
   
   string            m_value_title;
   CJson             m_headers;
   
public:
                     CHttpHeaders(void);
                    ~CHttpHeaders(void);
   
   //--- Basic methods
   void              Add(string value);
   void              Add(string key, string value);
   
   //--- Acess data
   string            GetKey(const int index);
   string            GetValue(const string key);
   bool              KeyIsPresent(const string key);
   int               Size(void);
   
   //--- Serialize/parse
   void              Parse(const string header);
   void              Parse(const char &header[], uint codepage = CP_UTF8);
   string            Serialize(void);
   string            Serialize(uchar &header[], uint codepage = CP_UTF8);
   void              Free(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpHeaders::CHttpHeaders(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CHttpHeaders::~CHttpHeaders(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpHeaders::Add(string value)
  {
   m_value_title = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpHeaders::Add(string key,string value)
  {
   m_headers[key] = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpHeaders::GetKey(const int index)
  {
   return(m_headers[index].m_key);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpHeaders::GetValue(const string key)
  {
   return(m_headers[key].ToString());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CHttpHeaders::KeyIsPresent(const string key)
  {
   return(m_headers.FindKey(key) != NULL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CHttpHeaders::Size(void)
  {
   return(m_headers.Size());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpHeaders::Parse(const string header)
  {
   string params[];
   int size = StringSplit(header,StringGetCharacter("\n",0),params);
   for(int i=0;i<size;i++)
     {
      int pos = StringFind(params[i],": ");
      if(pos >= 0)
        {
         string key = StringSubstr(params[i],0,pos);
         string value = StringSubstr(params[i],pos+2);
         
         StringTrimRight(value);
         //StringTrimLeft(value);
         
         this.Add(key,value);
        }
      else if(i == 0)
        {
         this.Add(params[i]);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpHeaders::Parse(const char &header[],uint codepage=CP_UTF8)
  {
   string header_str = CharArrayToString(header,0,WHOLE_ARRAY,codepage);
   this.Parse(header_str);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpHeaders::Serialize(void)
  {
   string headers;
   
   headers += m_value_title+"\r\n";
   for(int i=0;i<m_headers.Size();i++)
     {
      headers += m_headers[i].m_key+": "+m_headers[i].ToString()+ ((i == m_headers.Size()-1)? "\r\n\r\n" : "\r\n");
     }
   
   return(headers);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CHttpHeaders::Serialize(uchar &header[],uint codepage=CP_UTF8)
  {
   string header_str = this.Serialize();
   int res = StringToCharArray(header_str,header,0,WHOLE_ARRAY,codepage);
   ArrayRemove(header,res-1,1);
   return(header_str);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CHttpHeaders::Free(void)
  {
   m_headers.Clear();
   m_value_title = "";
  }
//+------------------------------------------------------------------+
