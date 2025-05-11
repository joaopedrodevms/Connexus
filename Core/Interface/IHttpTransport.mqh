//+------------------------------------------------------------------+
//|                                                HttpTransport.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
//+------------------------------------------------------------------+
//| transport interface                                              |
//+------------------------------------------------------------------+
interface IHttpTransport
  {
   int               Request(const string method,const string url,const string cookie,const string referer,int timeout,const char &data[],int data_size,char &result[],string &result_headers);
   int               Request(const string method,const string url,const string headers,int timeout,const char &data[],char &result[],string &result_headers);
  };
//+------------------------------------------------------------------+
