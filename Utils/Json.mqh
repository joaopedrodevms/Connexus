//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ENUM_TYPE_DATA_JSON
  {
   TYPE_DATA_JSON_UNDEFINED = 0,
   TYPE_DATA_JSON_OBJECT,
   TYPE_DATA_JSON_ARRAY,

   TYPE_DATA_JSON_NULL,
   TYPE_DATA_JSON_BOOL,
   TYPE_DATA_JSON_COLOR,
   TYPE_DATA_JSON_LONG,
   TYPE_DATA_JSON_ULONG,
   TYPE_DATA_JSON_STRING,
   TYPE_DATA_JSON_DOUBLE,
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct MqlDataType
  {
   ENUM_TYPE_DATA_JSON type_data;
   bool              bool_value;
   color             color_value;
   long              long_value;
   ulong             ulong_value;
   string            string_value;
   double            double_value;

   MqlDataType::MqlDataType(void)
     {
      type_data = TYPE_DATA_JSON_UNDEFINED;
      bool_value = false;
      color_value = clrNONE;
      long_value = 0;
      ulong_value = 0;
      string_value = "";
      double_value = 0.0;
     }
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CJson
  {
public:
   CJson             m_json[];
   string            m_key;
   MqlDataType       m_value;

public:
                     CJson(const CJson &json);
                     CJson(void);
                    ~CJson(void);

   //--- Assigns key and returns object
   CJson             *operator[](const string key);
   CJson             *operator[](const int index);

   //--- Add
   template<typename T>
   CJson             *Add(const T value);
   CJson             *Add(CJson &value);
   void              Set(CJson &value);
   void              Set(CJson &value[]);

   //--- Serialize/Deserialize
   string            Serialize(bool skey = false, bool comma = false);
   bool              Deserialize(uchar &json[], int &index, int len);
   bool              Deserialize(string json, uint codepage=0);

   //--- Size/Clear
   int               Size(void);
   void              Clear(void);
   CJson             *FindKey(string key);
   void              Remove(string key);

   //--- Operators
   void              operator=(CJson &value);
   void              operator=(const char value);
   void              operator=(const uchar value);
   void              operator=(const bool value);
   void              operator=(const short value);
   void              operator=(const ushort value);
   void              operator=(const int value);
   void              operator=(const uint value);
   void              operator=(const color value);
   void              operator=(const long value);
   void              operator=(const ulong value);
   void              operator=(const datetime value);
   void              operator=(const string value);
   void              operator=(const double value);
   void              operator=(const float value);
   //---
   bool              operator==(const char value) { return(m_value.long_value == value); };
   bool              operator==(const uchar value) { return(m_value.ulong_value == value); };
   bool              operator==(const bool value) { return(m_value.bool_value == value); };
   bool              operator==(const short value) { return(m_value.long_value == value); };
   bool              operator==(const ushort value) { return(m_value.ulong_value == value); };
   bool              operator==(const int value) { return(m_value.long_value == value); };
   bool              operator==(const uint value) { return(m_value.ulong_value == value); };
   bool              operator==(const color value) { return(m_value.color_value == value); };
   bool              operator==(const long value) { return(m_value.long_value == value); };
   bool              operator==(const ulong value) { return(m_value.ulong_value == value); };
   bool              operator==(const datetime value) { return(StringToTime(m_value.string_value) == value); };
   bool              operator==(const string value) { return(m_value.string_value == value); };
   bool              operator==(const double value) { return(m_value.double_value == value); };
   bool              operator==(const float value) { return(m_value.double_value == value); };
   //---
   bool              operator!=(const char value) { return(m_value.long_value != value); };
   bool              operator!=(const uchar value) { return(m_value.ulong_value != value); };
   bool              operator!=(const bool value) { return(m_value.bool_value != value); };
   bool              operator!=(const short value) { return(m_value.long_value != value); };
   bool              operator!=(const ushort value) { return(m_value.ulong_value != value); };
   bool              operator!=(const int value) { return(m_value.long_value != value); };
   bool              operator!=(const uint value) { return(m_value.ulong_value != value); };
   bool              operator!=(const color value) { return(m_value.color_value != value); };
   bool              operator!=(const long value) { return(m_value.long_value != value); };
   bool              operator!=(const ulong value) { return(m_value.ulong_value != value); };
   bool              operator!=(const datetime value) { return(StringToTime(m_value.string_value) != value); };
   bool              operator!=(const string value) { return(m_value.string_value != value); };
   bool              operator!=(const double value) { return(m_value.double_value != value); };
   bool              operator!=(const float value) { return(m_value.double_value != value); };
   //---
   bool              operator>(const char value) { return(m_value.long_value > value); };
   bool              operator>(const uchar value) { return(m_value.ulong_value > value); };
   bool              operator>(const bool value) { return(m_value.bool_value > value); };
   bool              operator>(const short value) { return(m_value.long_value > value); };
   bool              operator>(const ushort value) { return(m_value.ulong_value > value); };
   bool              operator>(const int value) { return(m_value.long_value > value); };
   bool              operator>(const uint value) { return(m_value.ulong_value > value); };
   bool              operator>(const color value) { return(m_value.color_value > value); };
   bool              operator>(const long value) { return(m_value.long_value > value); };
   bool              operator>(const ulong value) { return(m_value.ulong_value > value); };
   bool              operator>(const datetime value) { return(StringToTime(m_value.string_value) > value); };
   bool              operator>(const string value) { return(m_value.string_value > value); };
   bool              operator>(const double value) { return(m_value.double_value > value); };
   bool              operator>(const float value) { return(m_value.double_value > value); };
   //---
   bool              operator>=(const char value) { return(m_value.long_value >= value); };
   bool              operator>=(const uchar value) { return(m_value.ulong_value >= value); };
   bool              operator>=(const bool value) { return(m_value.bool_value >= value); };
   bool              operator>=(const short value) { return(m_value.long_value >= value); };
   bool              operator>=(const ushort value) { return(m_value.ulong_value >= value); };
   bool              operator>=(const int value) { return(m_value.long_value >= value); };
   bool              operator>=(const uint value) { return(m_value.ulong_value >= value); };
   bool              operator>=(const color value) { return(m_value.color_value >= value); };
   bool              operator>=(const long value) { return(m_value.long_value >= value); };
   bool              operator>=(const ulong value) { return(m_value.ulong_value >= value); };
   bool              operator>=(const datetime value) { return(StringToTime(m_value.string_value) >= value); };
   bool              operator>=(const string value) { return(m_value.string_value >= value); };
   bool              operator>=(const double value) { return(m_value.double_value >= value); };
   bool              operator>=(const float value) { return(m_value.double_value >= value); };
   //---
   bool              operator<(const char value) { return(m_value.long_value < value); };
   bool              operator<(const uchar value) { return(m_value.ulong_value < value); };
   bool              operator<(const bool value) { return(m_value.bool_value < value); };
   bool              operator<(const short value) { return(m_value.long_value < value); };
   bool              operator<(const ushort value) { return(m_value.ulong_value < value); };
   bool              operator<(const int value) { return(m_value.long_value < value); };
   bool              operator<(const uint value) { return(m_value.ulong_value < value); };
   bool              operator<(const color value) { return(m_value.color_value < value); };
   bool              operator<(const long value) { return(m_value.long_value < value); };
   bool              operator<(const ulong value) { return(m_value.ulong_value < value); };
   bool              operator<(const datetime value) { return(StringToTime(m_value.string_value) < value); };
   bool              operator<(const string value) { return(m_value.string_value < value); };
   bool              operator<(const double value) { return(m_value.double_value < value); };
   bool              operator<(const float value) { return(m_value.double_value < value); };
   //---
   bool              operator<=(const char value) { return(m_value.long_value <= value); };
   bool              operator<=(const uchar value) { return(m_value.ulong_value <= value); };
   bool              operator<=(const bool value) { return(m_value.bool_value <= value); };
   bool              operator<=(const short value) { return(m_value.long_value <= value); };
   bool              operator<=(const ushort value) { return(m_value.ulong_value <= value); };
   bool              operator<=(const int value) { return(m_value.long_value <= value); };
   bool              operator<=(const uint value) { return(m_value.ulong_value <= value); };
   bool              operator<=(const color value) { return(m_value.color_value <= value); };
   bool              operator<=(const long value) { return(m_value.long_value <= value); };
   bool              operator<=(const ulong value) { return(m_value.ulong_value <= value); };
   bool              operator<=(const datetime value) { return(StringToTime(m_value.string_value) <= value); };
   bool              operator<=(const string value) { return(m_value.string_value <= value); };
   bool              operator<=(const double value) { return(m_value.double_value <= value); };
   bool              operator<=(const float value) { return(m_value.double_value <= value); };
   //--- Get
   char              ToChar(void);
   uchar             ToUchar(void);
   bool              ToBool(void);
   short             ToShort(void);
   ushort            ToUshort(void);
   int               ToInt(void);
   uint              ToUint(void);
   color             ToColor(void);
   long              ToLong(void);
   ulong             ToUlong(void);
   datetime          ToDatetime(void);
   string            ToString(void);
   double            ToDouble(void);
   float             ToFloat(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson::CJson(const CJson &json)
  {
   this.Clear();
   m_value = json.m_value;
   m_key = json.m_key;

   int size = ArraySize(json.m_json);
   ArrayFree(m_json);
   ArrayResize(m_json,size);
   for(int i=0;i<size;i++)
     {
      m_json[i] = json.m_json[i];
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson::CJson(void)
  {
   m_value.type_data = TYPE_DATA_JSON_UNDEFINED;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson::~CJson(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson *CJson::operator[](const string key)
  {
   if(m_value.type_data == TYPE_DATA_JSON_UNDEFINED || m_value.type_data == TYPE_DATA_JSON_NULL)
     {
      m_value.type_data = TYPE_DATA_JSON_OBJECT;
     }

   int size = ArraySize(m_json);
   for(int i=0;i<size;i++)
     {
      if(m_json[i].m_key == key)
        {
         return(GetPointer(m_json[i]));
        }
     }

   ArrayResize(m_json,size+1);
   m_json[size].m_key = key;
   return(GetPointer(m_json[size]));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson *CJson::operator[](const int index)
  {
   if(index >= Size())
     {
      CJson son;
      if(CheckPointer(Add(son))==POINTER_INVALID)
        {
         return(NULL);
        }
     }
   return GetPointer(m_json[index]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::Set(CJson &value)
  {
   if(m_value.type_data == TYPE_DATA_JSON_UNDEFINED)
     {
      m_value.type_data = TYPE_DATA_JSON_OBJECT;
     }
   int size = ArraySize(value.m_json);
   ArrayFree(m_json);
   ArrayResize(m_json,size);
   for(int i=0;i<size;i++)
     {
      m_json[i] = value.m_json[i];
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::Set(CJson &value[])
  {
   if(m_value.type_data == TYPE_DATA_JSON_UNDEFINED)
     {
      m_value.type_data = TYPE_DATA_JSON_ARRAY;
     }
   int size = ArraySize(value);
   ArrayFree(m_json);
   ArrayResize(m_json,size);
   for(int i=0;i<size;i++)
     {
      m_json[i] = value[i];
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson *CJson::Add(CJson &value)
  {
   if(m_value.type_data == TYPE_DATA_JSON_UNDEFINED)
     {
      m_value.type_data = TYPE_DATA_JSON_ARRAY;
     }
   int size = ArraySize(m_json);
   ArrayResize(m_json,size+1);
   m_json[size] = value;
   return(GetPointer(m_json[size]));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T>
CJson *CJson::Add(const T value)
  {
   CJson json;
   json = value;
   return(this.Add(json));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(CJson &value)
  {
   m_key = value.m_key;
   m_value = value.m_value;

   int size = ArraySize(value.m_json);
   ArrayFree(m_json);
   ArrayResize(m_json,size);
   for(int i=0;i<size;i++)
     {
      m_json[i] = value.m_json[i];
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CJson::Serialize(bool skey = false, bool comma = false)
  {
   if(m_value.type_data == TYPE_DATA_JSON_UNDEFINED)
     {
      return("{}");
     }

   string content = "";
   if(comma)
     {
      content += ",";
     }
   if(skey)
     {
      content += "\""+m_key+ "\":";
     }

   switch(m_value.type_data)
     {
      case(TYPE_DATA_JSON_ARRAY):
        {
         content += "[";
         int size_obj = ArraySize(m_json);
         for(int i=0;i<size_obj;i++)
           {
            content += m_json[i].Serialize(false,i>0);
           }
         content += "]";
         break;
        }
      case(TYPE_DATA_JSON_OBJECT):
        {
         content += "{";
         int size_obj = ArraySize(m_json);
         for(int i=0;i<size_obj;i++)
           {
            content += m_json[i].Serialize(true,i>0);
           }
         content += "}";
         break;
        }
      case(TYPE_DATA_JSON_STRING):
        {
         content += "\"" + m_value.string_value + "\"";
         break;
        }
      case(TYPE_DATA_JSON_COLOR):
        {
         content += "\"" + m_value.string_value + "\"";
         break;
        }
      default:
        {
         content += m_value.string_value;
         break;
        }
     }

   return(content);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CJson::Deserialize(string json, uint codepage=0)
  {
   this.Clear();
   uchar uchar_json[];
   int len = StringToCharArray(json,uchar_json,0,WHOLE_ARRAY,codepage), i = 0;
   return(this.Deserialize(uchar_json,i,len));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CJson::Deserialize(uchar &json[], int &index, int len)
  {
   string key = "";
   while(index<len)
     {
      uchar character = json[index];
      switch(character)
        {
         case(0):
         case('\t'):
         case('\r'):
         case('\n'):
         case(' '):
           {
            break;
           }
         case('{'):
           {
            index++;
            m_value.type_data = TYPE_DATA_JSON_OBJECT;
            if(!Deserialize(json,index,len))
              {
               return(false);
              }
            return(json[index] == '}' || json[index] == 0);
           }
         case('['):
           {
            index++;
            
            CJson array;
            m_value.type_data = TYPE_DATA_JSON_ARRAY;
            while(array.Deserialize(json, index, len))
              {
               Add(array);
               if(m_value.type_data != TYPE_DATA_JSON_OBJECT)
                 {
                  index++;
                 }
               
               array.Clear();
               if(json[index]==']')
                 {
                  break;
                 }
               if(index>=len)
                 {
                  return false;
                 }
              }
            return json[index]==']' || json[index]==0;
           }
         case('"'):
           {
            if(m_value.type_data == TYPE_DATA_JSON_OBJECT)
              {
               index++;
               key = "";
               for(int j=index;j<len;j++)
                 {
                  if(json[j] == '"')
                    {
                     index = j;
                     break;
                    }
                  else
                    {
                     key += CharToString(json[j]);
                    }
                 }
              }
            else
              {
               index++;
               string value = "";
               for(int j=index;j<len;j++)
                 {
                  //--- 92 = '\'
                  if(json[j] == 92)
                    {
                     continue;
                    }
                  if(json[j] == '"' && json[j-1] != 92) // 
                    {
                     index = j;
                     break;
                    }
                  else
                    {
                     value += CharToString(json[j]);
                    }
                 }
               this.operator=(value);
               return(true);
              }
            break;
           }
         case '0':
         case '1':
         case '2':
         case '3':
         case '4':
         case '5':
         case '6':
         case '7':
         case '8':
         case '9':
         case '-':
         case '+':
         case '.':
           {
            string num="0123456789+-.eE";
            bool is_dbl = false;

            string value = "";
            for(int j=index;j<len;j++)
              {
               if(StringFind(num,CharToString(json[j])) < 0)
                 {
                  index = j-1;
                  break;
                 }
               if(!is_dbl)
                 {
                  is_dbl = json[j]=='.' || json[j]=='e' || json[j]=='E';
                 }
               value += CharToString(json[j]);
              }

            if(is_dbl)
              {
               this.operator=(StringToDouble(value));
              }
            else
              {
               this.operator=(StringToInteger(value));
              }
            return(true);
           }
         case 't':
         case 'T':
         case 'f':
         case 'F':
           {
            if(index+1 < len)
              {
               if(json[index+1] == 'r')
                 {
                  this.operator=(true);
                  index+=3;
                  if(index >= len || json[index] != 'e')
                    {
                     return(false);
                    }
                  return(true);
                 }
               else if(json[index+1] == 'a')
                 {
                  this.operator=(false);
                  index+=4;
                  if(index >= len || json[index] != 'e')
                    {
                     return(false);
                    }
                  return(true);
                 }
               else
                 {
                  if(json[index] == 'T' || json[index] == 't')
                    {
                     this.operator=(true);
                     return(true);
                    }
                  else if(json[index] == 'F' || json[index] == 'f')
                    {
                     this.operator=(false);
                     return(true);
                    }
                 }
              }
            else
              {
               return(false);
              }
            break;
           }
         case 'n':
         case 'N':
           {
            if(index+1 < len)
              {
               if(json[index+1] == 'u')
                 {
                  m_value.type_data = TYPE_DATA_JSON_NULL;
                  index+=3;
                  if(index >= len || (json[index] != 'l' && json[index] != 'L'))
                    {
                     return(false);
                    }
                  return(true);
                 }
               else if(json[index] == 'N' || json[index] == 'n')
                 {
                  m_value.type_data = TYPE_DATA_JSON_NULL;
                  return(true);
                 }
              }
            else
              {
               return(false);
              }
            break;
           }
         case(':'):
           {
            if(key == "")
              {
               return(false);
              }
            else
              {
               index++;
               CJson new_json;
               CJson *child_json = Add(new_json);
               child_json.m_key = key;
               child_json.m_value.type_data = TYPE_DATA_JSON_NULL;
               if(!child_json.Deserialize(json,index,len))
                 {
                  return(false);
                 }
              }
            break;
           }
         case('}'):
           {
            return(m_value.type_data == TYPE_DATA_JSON_OBJECT);
           }
         case(']'):
           {
            break;
           }
        }
      index++;
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CJson::Size(void)
  {
   return(ArraySize(m_json));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::Clear(void)
  {
   ArrayFree(m_json);
   m_key = "";
   m_value.type_data = TYPE_DATA_JSON_NULL;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJson *CJson::FindKey(string key)
  {
   for(int i=this.Size()-1;i>=0;i--)
     {
      if(m_json[i].m_key == key)
        {
         return(GetPointer(m_json[i]));
        }
     }
   return(NULL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::Remove(string key)
  {
   CJson *json = this.FindKey(key);
   if(json != NULL)
     {
      int size = ArraySize(m_json);
      for(int i=0;i<size;i++)
        {
         if(m_json[i].m_key == key)
           {
            ArrayRemove(m_json,i,1);
            break;
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const char value)
  {
   m_value.type_data = TYPE_DATA_JSON_LONG;
   m_value.bool_value = value;
   m_value.color_value = value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const uchar value)
  {
   m_value.type_data = TYPE_DATA_JSON_ULONG;
   m_value.bool_value = value;
   m_value.color_value = value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const bool value)
  {
   m_value.type_data = TYPE_DATA_JSON_BOOL;
   m_value.bool_value = value;
   m_value.color_value = value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = (value)? "true" : "false";
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const short value)
  {
   m_value.type_data = TYPE_DATA_JSON_LONG;
   m_value.bool_value = value;
   m_value.color_value = value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const ushort value)
  {
   m_value.type_data = TYPE_DATA_JSON_ULONG;
   m_value.bool_value = value;
   m_value.color_value = value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const int value)
  {
   m_value.type_data = TYPE_DATA_JSON_LONG;
   m_value.bool_value = value;
   m_value.color_value = (color)value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const uint value)
  {
   m_value.type_data = TYPE_DATA_JSON_ULONG;
   m_value.bool_value = value;
   m_value.color_value = (color)value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const color value)
  {
   m_value.type_data = TYPE_DATA_JSON_COLOR;
   m_value.bool_value = value;
   m_value.color_value = value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = ColorToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const long value)
  {
   m_value.type_data = TYPE_DATA_JSON_LONG;
   m_value.bool_value = value;
   m_value.color_value = (color)value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = (double)value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const ulong value)
  {
   m_value.type_data = TYPE_DATA_JSON_ULONG;
   m_value.bool_value = value;
   m_value.color_value = (color)value;
   m_value.long_value = (long)value;
   m_value.ulong_value = value;
   m_value.string_value = IntegerToString(value);
   m_value.double_value = (double)value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const datetime value)
  {
   m_value.type_data = TYPE_DATA_JSON_STRING;
   m_value.bool_value = value;
   m_value.color_value = (color)value;
   m_value.long_value = value;
   m_value.ulong_value = value;
   m_value.string_value = TimeToString(value,TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   m_value.double_value = (double)value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const string value)
  {
   m_value.type_data = TYPE_DATA_JSON_STRING;

   m_value.bool_value = (value == "T" || value == "t" || value == "True" || value == "true")? true : false;;
   m_value.color_value = StringToColor(value);
   m_value.long_value = StringToInteger(value);
   m_value.ulong_value = StringToInteger(value);
   m_value.string_value = value;
   m_value.double_value = StringToDouble(value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const double value)
  {
   m_value.type_data = TYPE_DATA_JSON_DOUBLE;
   m_value.bool_value = (bool)value;
   m_value.color_value = (color)value;
   m_value.long_value = (long)value;
   m_value.ulong_value = (ulong)value;
   m_value.string_value = DoubleToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CJson::operator=(const float value)
  {
   m_value.type_data = TYPE_DATA_JSON_DOUBLE;
   m_value.bool_value = value;
   m_value.color_value = (color)value;
   m_value.long_value = (long)value;
   m_value.ulong_value = (ulong)value;
   m_value.string_value = DoubleToString(value);
   m_value.double_value = value;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
char CJson::ToChar(void)
  {
   return((char)m_value.long_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uchar CJson::ToUchar(void)
  {
   return((uchar)m_value.ulong_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CJson::ToBool(void)
  {
   return(m_value.bool_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
short CJson::ToShort(void)
  {
   return((short)m_value.long_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ushort CJson::ToUshort(void)
  {
   return((ushort)m_value.ulong_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CJson::ToInt(void)
  {
   return((int)m_value.long_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint CJson::ToUint(void)
  {
   return((uint)m_value.ulong_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color CJson::ToColor(void)
  {
   return(m_value.color_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
long CJson::ToLong(void)
  {
   return(m_value.long_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong CJson::ToUlong(void)
  {
   return(m_value.ulong_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime CJson::ToDatetime(void)
  {
   return(StringToTime(m_value.string_value));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CJson::ToString(void)
  {
   return(m_value.string_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CJson::ToDouble(void)
  {
   return(m_value.double_value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
float CJson::ToFloat(void)
  {
   return((float)m_value.double_value);
  }
//+------------------------------------------------------------------+
