//+------------------------------------------------------------------+
//| Include the file CJson class                                     |
//+------------------------------------------------------------------+
#include "Json.mqh"
//+------------------------------------------------------------------+
//| class : CQueryParam                                              |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CQueryParam                                        |
//| Heritage    : No heritage                                        |
//| Description : Manages query parameters for HTTP requests         |
//|                                                                  |
//+------------------------------------------------------------------+
class CQueryParam
  {
private:

   CJson             m_parameters;                       // Storage for query parameters

public:
                     CQueryParam(void);
                    ~CQueryParam(void);

   //--- Functions to manage query parameters
   void              Add(string key, string value);      // Add a key-value pair
   void              AddKey(string param);               // Add a single key-value parameter
   void              AddParameters(const string &params[]);// Add multiple parameters
   void              Remove(const string key);           // Remove a parameter by key
   string            GetValue(const string key) const;   // Retrieve a parameter value by key
   bool              ContainsKey(const string key);      // Check if parameter exists
   int               Size(void);                         // Get the number of parameters

   //--- Auxiliary methods
   bool              ParseQueryString(const string query_param); // Parse a query string
   string            ToString(void);                // Serialize parameters into a query string
   void              Clear(void);                        // Clear all parameters
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CQueryParam::CQueryParam(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CQueryParam::~CQueryParam(void)
  {
  }
//+------------------------------------------------------------------+
//| Adds a key-value pair to the query parameters                    |
//+------------------------------------------------------------------+
void CQueryParam::Add(string key, string value)
  {
   m_parameters[key] = value;
  }
//+------------------------------------------------------------------+
//| Adds a single parameter from a formatted string                  |
//+------------------------------------------------------------------+
void CQueryParam::AddKey(string param)
  {
   //--- Check if the input string contains an "=" symbol, which indicates a key-value pair
   if(StringFind(param,"=") >= 0)
     {
      //--- Declare an array to hold the key and value after splitting the string
      string key_value[];
      
      //--- Split the input string using "=" as the delimiter and store the result in the key_value array
      int size = StringSplit(param,StringGetCharacter("=",0),key_value);
      
      //--- If the size of the split result is exactly 2 (meaning a valid key-value pair was found)
      if(size == 2)
        {
         // Add the key-value pair to the m_parameters map
         // key_value[0] is the key, key_value[1] is the value
         m_parameters[key_value[0]] = key_value[1];
        }
     }
  }
//+------------------------------------------------------------------+
//| Adds multiple parameters from an array of formatted strings      |
//+------------------------------------------------------------------+
void CQueryParam::AddParameters(const string &params[])
  {
   //--- Get the size of the input array 'params'
   int size = ArraySize(params);
   
   //--- Loop through each element in the 'params' array.
   for(int i=0;i<size;i++)
     {
      //--- Call the AddParam function to add each parameter to the m_parameters map.
      this.AddKey(params[i]);
     }
  }
//+------------------------------------------------------------------+
//| Removes a parameter by key                                       |
//+------------------------------------------------------------------+
void CQueryParam::Remove(const string key)
  {
   m_parameters.Remove(key);
  }
//+------------------------------------------------------------------+
//| Retrieves a parameter value by key                               |
//+------------------------------------------------------------------+
string CQueryParam::GetValue(const string key) const
  {
   return(m_parameters[key].ToString());
  }
//+------------------------------------------------------------------+
//| Checks if a parameter exists by key                              |
//+------------------------------------------------------------------+
bool CQueryParam::ContainsKey(const string key)
  {
   return(m_parameters.FindKey(key) != NULL);
  }
//+------------------------------------------------------------------+
//| Returns the number of parameters stored                          |
//+------------------------------------------------------------------+
int CQueryParam::Size(void)
  {
   return(m_parameters.Size());
  }
//+------------------------------------------------------------------+
//| Parses a query string into parameters                            |
//| Input: query_param - A string formatted as a query parameter     |
//| Output: bool - Always returns true, indicating successful parsing|
//+------------------------------------------------------------------+
bool CQueryParam::ParseQueryString(const string query_param)
  {
   //--- Split the input string by '&', separating the individual parameters
   string params[];
   int size = StringSplit(query_param, StringGetCharacter("&",0), params);

   //--- Iterate through each parameter string
   for(int i=0; i<size; i++)
     {
      //--- Split each parameter string by '=', separating the key and value
      string key_value[];
      StringSplit(params[i], StringGetCharacter("=",0), key_value);

      //--- Check if the split resulted in exactly two parts: key and value
      if (ArraySize(key_value) == 2)
        {
         //--- Assign the value to the corresponding key in the map
         m_parameters[key_value[0]] = key_value[1];
        }
     }
   //--- Return true indicating that parsing was successful
   return(true);
  }
//+------------------------------------------------------------------+
//| Serializes the stored parameters into a query string             |
//| Output: string - A string representing the serialized parameters |
//+------------------------------------------------------------------+
string CQueryParam::ToString(void)
  {
   //--- Initialize an empty string to build the query parameter string
   string query_param = "";

   //--- Iterate over each key-value pair in the parameter map
   for(int i=0; i<m_parameters.Size(); i++)
     {
      //--- Append a '?' at the beginning to indicate the start of parameters
      if(i == 0)
        {
         query_param = "?";
        }

      //--- Construct each key-value pair as 'key=value'
      if(i == m_parameters.Size()-1)
        {
         //--- If it's the last pair, don't append '&'
         query_param += m_parameters[i].m_key + "=" + m_parameters[i].ToString();
        }
      else
        {
         //--- Otherwise, append '&' after each pair
         query_param += m_parameters[i].m_key + "=" + m_parameters[i].ToString() + "&";
        }
     }

   //--- Return the constructed query parameter string
   return(query_param);
  }
//+------------------------------------------------------------------+
//| Clears all stored parameters                                     |
//+------------------------------------------------------------------+
void CQueryParam::Clear(void)
  {
   m_parameters.Clear();
  }
//+------------------------------------------------------------------+
