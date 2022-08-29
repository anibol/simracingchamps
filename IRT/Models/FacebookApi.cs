using Facebook;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IRT.Models
{
    public class FacebookApi
    {
        public static string RefreshTokenAndPostToFacebook(string currentAccessToken)
        {
            string newAccessToken = RefreshAccessToken(currentAccessToken);
            string pageAccessToken = GetPageAccessToken(newAccessToken);
            PostToFacebook(pageAccessToken);
            return newAccessToken; // replace current access token with this
        }

        public static string GetPageAccessToken(string userAccessToken)
        {
            FacebookClient fbClient = new FacebookClient();
            fbClient.AppId = "app id";
            fbClient.AppSecret = "app secret";
            fbClient.AccessToken = userAccessToken;
            Dictionary<string, object> fbParams = new Dictionary<string, object>();
            JsonObject publishedResponse = fbClient.Get("/me/accounts", fbParams) as JsonObject;
            JArray data = JArray.Parse(publishedResponse["data"].ToString());

            foreach (var account in data)
            {
                if (account["name"].ToString().ToLower().Equals("your page name"))
                {
                    return account["access_token"].ToString();
                }
            }

            return String.Empty;
        }

        public static string RefreshAccessToken(string currentAccessToken)
        {
            FacebookClient fbClient = new FacebookClient();
            Dictionary<string, object> fbParams = new Dictionary<string, object>();
            fbParams["client_id"] = "app id";
            fbParams["grant_type"] = "fb_exchange_token";
            fbParams["client_secret"] = "app secret";
            fbParams["fb_exchange_token"] = currentAccessToken;
            JsonObject publishedResponse = fbClient.Get("/oauth/access_token", fbParams) as JsonObject;
            return publishedResponse["access_token"].ToString();
        }

        public static void PostToFacebook(string pageAccessToken)
        {
            FacebookClient fbClient = new FacebookClient(pageAccessToken);
            fbClient.AppId = "app id";
            fbClient.AppSecret = "app secret";
            Dictionary<string, object> fbParams = new Dictionary<string, object>();
            fbParams["message"] = "Test message";
            var publishedResponse = fbClient.Post("/your_page_name/feed", fbParams);
        }
    }
}