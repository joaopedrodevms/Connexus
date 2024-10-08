//+------------------------------------------------------------------+
//|                                                  WebRequest-MQL5 |
//|                                     Copyright 2024 - Quantstone  |
//|                                        https://quantstone.com.br |
//|                                               João Pedro Sampaio |
//+------------------------------------------------------------------+

#include "IQueryParam.mqh"
#include "../../Data/Json.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CQueryParam : public IQueryParam
  {
private:
   
   CJson             m_param;
   
public:
                     CQueryParam(void);
                    ~CQueryParam(void);
   
   //--- Basic methods
   void              Add(string key, string value);
   
   //--- Acess data
   string            GetKey(const int index);
   string            GetValue(const string key);
   bool              KeyIsPresent(const string key);
   int               Size(void);
   
   //--- Serialize/parse
   bool              Parse(string query_param);
   string            Serialize(void);
   int               ToCharArray(uchar &char_array[], uint codepage = CP_UTF8);
   void              Free(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CQueryParam::CQueryParam(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CQueryParam::~CQueryParam(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CQueryParam::Add(string key,string value)
  {
   m_param[key] = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CQueryParam::GetKey(const int index)
  {
   return(m_param[index].m_key);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CQueryParam::GetValue(const string key)
  {
   return(m_param[key].ToString());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CQueryParam::Parse(string query_param)
  {
   string params[];
   int size = StringSplit(query_param,StringGetCharacter("&",0),params);
   for(int i=0;i<size;i++)
     {
      string key_value[];
      StringSplit(params[i],StringGetCharacter("=",0),key_value);
      this.Add(key_value[0],key_value[1]);
     }
   
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CQueryParam::KeyIsPresent(const string key)
  {
   return(m_param.FindKey(key) != NULL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CQueryParam::Size(void)
  {
   return(m_param.Size());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CQueryParam::Serialize(void)
  {
   string param;
   
   for(int i=0;i<m_param.Size();i++)
     {
      if(i == 0)
        {
         param = "?";
        }
      if(i == m_param.Size()-1)
        {
         param += m_param[i].m_key+"="+m_param[i].ToString();
        }
      else
        {
         param += m_param[i].m_key+"="+m_param[i].ToString()+"&";
        }
     }
   
   return(param);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CQueryParam::ToCharArray(uchar &char_array[], uint codepage = CP_UTF8)
  {
   return(StringToCharArray(this.Serialize(),char_array,0,WHOLE_ARRAY,codepage));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CQueryParam::Free(void)
  {
   m_param.Clear();
  }
//+------------------------------------------------------------------+
