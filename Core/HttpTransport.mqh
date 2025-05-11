//+------------------------------------------------------------------+
//|                                                HttpTransport.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "Interface/IHttpTransport.mqh"
//+------------------------------------------------------------------+
//| class : CHttpTransport                                           |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CHttpTransport                                     |
//| Heritage    : IHttpTransport                                     |
//| Description : class that implements the transport interface,     |
//|               works as an extra layer between the request and    |
//|               the final function and WebRequest.                 |
//|                                                                  |
//+------------------------------------------------------------------+
class CHttpTransport : public IHttpTransport
  {
public:
                     CHttpTransport(void);
                    ~CHttpTransport(void);

   int               Request(const string method,const string url,const string cookie,const string referer,int timeout,const char &data[],int data_size,char &result[],string &result_headers);
   int               Request(const string method,const string url,const string headers,int timeout,const char &data[],char &result[],string &result_headers);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CHttpTransport::CHttpTransport(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CHttpTransport::~CHttpTransport(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CHttpTransport::Request(const string method,const string url,const string cookie,const string referer,int timeout,const char &data[],int data_size,char &result[],string &result_headers)
  {
   return(WebRequest(method,url,cookie,referer,timeout,data,data_size,result,result_headers));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CHttpTransport::Request(const string method,const string url,const string headers,int timeout,const char &data[],char &result[],string &result_headers)
  {
   return(WebRequest(method,url,headers,timeout,data,result,result_headers));
  }
//+------------------------------------------------------------------+