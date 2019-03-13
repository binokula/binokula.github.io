# Developer Guide ![](images/favicon.png)

###Introduction
The Binokula API provides external applications the ability to access, edit or add objects related to the Binokula application. Current end-points focus on user management and access to reports. All API calls are secured with SSL, tenant names and API Keys (client_secret). If you need access to your client_secret, please contact <support@binokula.app>.

###Client Secret
Your Client is used to access Binokula's API endpoints. Your tenants Client Secret can be accessed by an Admin account. To find your tenants Client Secret:

1. Sign into Binokula with an Admin account
+ Navigate to the Administrator page
+ Go to Portal settings
+ Find the label Client Secret and click "Show Client Secret"

From there you can copy the Client Secret and start using Binokula APIs!

###Single-Sign On
####Overview
Single-Sign On (SSO) enables external applications to give users access to Binokula without the need for them to enter their Binokula password. Access to Binokula is gained with the combination of a user's email address and a securely generated access token. The access token is valid for one hour and can be refreshed using the API. Binokula will check if the users email is registered as a system user and if the access token is valid before granting access to the application. If authentication fails, a redirect to the Binokula login page will be executed. Only one user token can be active at any given time.

```mermaid
sequenceDiagram
    User->>Organization App: User Requests access to Binokula
    Organization App->>Binokula API: App requests access_token from API
    Binokula API->>Organization App: App constructs SSO URL with token
    Organization App->>Binokula App: App opens Binokula App URL
    Binokula App->>Binokula App: If valid, Binokula reports are shown
    Binokula App->>Binokula App: If not valid, Binokula Login page is shown
    
```


####Endpoints
#####Issue/Renew User Access Token
**URL:** <https://api.binokula.app/api/Token>

**HTTP Verb:** GET

**Headers:**

* client_secret

**Parameters:**

* email
* tenant
* code
    * This is a function key provided to the customer to access this endpoint
* existingusersonly **(optional)**
    * Boolean
    * Default set to "false". When "true" a valid token is only generated for existing users. Can be used to stop users from being auto-created.
* alias **(optional)**
    * This is used to assign the user an alias upon access token creation
* aliasEnable **(optional)**
    * Boolean
    * Default set to "false". When "true" the alias assigned to the user will be used in the reports RLS filtering.
    * Note: If the Alias is enabled but no alias is assigned to the user then Binokula will use the users email as the RLS filtering by default 

Response:

Status: 200 OK
```json
{
    "email": "example@example.com",
    "access_token": "FbyIcycqczD6sT519Clgo2iNoW3wxXupT2uxRbUrGO8=",
    "expiry_date": "2018-04-26T03:08:03.893495+00:00"
}
```

RLS Aliasing Notes:

* The RLS Alias optional parameters made in the request of the access token are applied when the access token is used
* If the access token has not been used before it has expired then the RLS Alias parameters in will not be saved to the user

#####(Redirect to) Binokula External Access
**URL:** <https://binokula.app/Account/ExternalAccess>

**Parameters:**

* email
* access_token
* tenant

**Response:**

* Status: 200 OK
* Redirects to users Binokula homepage

**Note:** Credentials are URL encoded

###User Management
####Overview
The User Management API enables external applications to register, delete, enable or disable users to their Binokula tenant. This register endpoint creates a user with an email and generates a secure password for the newly created user. The password is not known to the external application nor the registered user. To access this endpoint the external application must supply the API a valid client secret key along with tenant name.

####Endpoints
#####Register User
**URL:** <https://api.binokula.app/api/User>

**HTTP Verb:** PUT

**Headers:**

* client_secret

**Parameters:**

* email
* tenant
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

```json
{
    "message": "\"Successfully registered example@example.com\""
}
```

#####Delete User
**URL:** <https://api.binokula.app/api/User>

**HTTP Verb:** Delete

**Headers:**

* client_secret

**Parameters:**

* email
* tenant
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

```json
{
    "message": "\"Successfully removed example@example.com\""
}
```

#####Enable/Disable User
**URL:** <https://api.binokula.app/api/UserStatus>

**HTTP Verb:** Post

**Headers:**

* client_secret

**Parameters:**

* email
* tenant
* status ("true" - enables user/"false" - disables user)
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

```json
{
    "message": "\"User Status set to true/false\""
}
```

#####User Group List
**URL:** <https://api.binokula.app/api/UserGroup/List>

**HTTP Verb:** Get

**Headers:**

* client_secret

**Parameters:**

* email **(optional)**
* group **(optional)**
* tenant
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

#####User Activity List
**URL:** <https://api.binokula.app/api/EventActivity/List>

**HTTP Verb:** Get

**Headers:**

* client_secret

**Parameters:**

* email **(optional)**
* event **(optional)**
    * user_delete
    * user_add
    * report_view
    * portal_login
    * sso_login
    * forgot_pwd_invalid
    * disable_user
    * forgot_pwd_valid
* start_time **(optional)**
    * Any datetime string format 
* end_time **(optional)**
    * Any datetime string format
* order **(optional)**
    * Default: Descending
    * asc/desc
    * Order by timestamp
* tenant
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

```json
[{
    "timestamp": "2019-03-07T02:04:26.2046466",
    "user": "test@email.com",
    "eventActivity": "report_view"
}, {
    "timestamp": "2019-03-07T02:04:16.8408495",
    "user": "test@email.com",
    "eventActivity": "portal_login"
}, {
    "timestamp": "2019-03-07T00:13:37.3125127",
    "user": "test@email.com",
    "eventActivity": "user_add"
}]
```

###Embedding Binokula Generated Reports
####Overview
The Binokula API can provide you with the necessary tokens and credentials to embed Binokula generated reports on your own web page. In order to embed Binokula generated to your own webpage, you must use the [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embedding-Basics#application-owns-the-data) and use Binokula generated embed tokens to do so. To embed a Binokula generated report you will need:

* Report ID
* Dataset Id
* Embed Token

To get the above you will need to use the Binokula API. 

Note: Binokula is not responsible for the security implemented on your independent web page. Developers must ensure that reports they are embedding are only visible to their intended users.

####Endpoints

#####Get Report List
**URL:** <https://api.binokula.app/api/Report/List>

**HTTP Verb:** Get

**Headers:**

* client_secret

**Parameters:**

* email
* tenant
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

```json
[
    {
        "id": "34b55d62-8f20-4923-b8ee-0c3f58f94892",
        "name": "Sample Report 01",
        "webUrl": "https://app.powerbi.com/groups/6734dd6e-8ff5-567h-3dfg-b52d2088dc01/reports/34b534t82-8e31-5647-v6ff-0c3f58f94892",
        "embedUrl": "https://app.powerbi.com/reportEmbed?reportId=34b55d62-8f20-4923-b8ee-0c3f58f94892&groupId=5628bb5c-3dd1-489e-8ecd-b52d2088dc01&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9XQUJJLUFVU1RSQUxJQS1TT1VUSEVBU1QtcmVkaXJlY3fryW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d",
        "datasetId": "a938cc1f-9883-4987-a74a-c37dc2e249bc"
    },
    {
        "id": "cac52e2a-3e77-4078-a9bb-f63fb730cfc6",
        "name": "Sample Report 02",
        "webUrl": "https://app.powerbi.com/groups/6734dd6e-8ff5-567h-3dfg-b52d2088dc01/reports/34b534t82-8e31-5647-v6ff-0c3f58f94892",
        "embedUrl": "https://app.powerbi.com/reportEmbed?reportId=cac52e2a-3e77-4078-a9bb-f63fb730cfc6&groupId=5628bb5c-3dd1-489e-8ecd-b52d2088dc01&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9XQUJJLUFVU1RSQUxJQS1TT1VUSEVBU1QtcmVkaXJlY3fryW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d",
        "datasetId": "1dyolo48-c963-4863-8c87-521af138b12e"
    },
    {
        "id": "1fc65d7d-9c70-47cc-a40f-ce3d95c904a3",
        "name": "Sample Report 03",
        "webUrl": "https://app.powerbi.com/groups/6734dd6e-8ff5-567h-3dfg-b52d2088dc01/reports/34b534t82-8e31-5647-v6ff-0c3f58f94892",
        "embedUrl": "https://app.powerbi.com/reportEmbed?reportId=1fc65d7d-9c70-47cc-a40f-ce3d95c904a3&groupId=5628bb5c-3dd1-489e-8ecd-b52d2088dc01&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9XQUJJLUFVU1RSQUxJQS1TT1VUSEVBU1QtcmVkaXJlY3fryW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d",
        "datasetId": "41986b45-0e9a-4881-9ec4-2yolo825e199"
    }
]
```

#####Get Embed Token
**URL:** <https://api.binokula.app/api/Report/EmbedToken>

**HTTP Verb:** Get

**Headers:**

* client_secret

**Parameters:**

* email
* tenant
* reportId
* datasetId
* code
    * This is a function key provided to the customer to access this endpoint

**Response:**

* Status: 200 OK

```json
{
    "token": "H4sIAAAAAAAEAC1WRQ7siBG9y986kpkizcLMbLdhZ7vNzBDl7umMZl9SlV49-s8fO336Kf3--fefMFHWuGFJzgaTU3aLPUPeXL0ECfOaGBLOHJEGVlvYSfquO6mCfTLkQCALseeER9LkrMfOMVIcNG2xgxIOyI20iCJ-HYvUFwTFh0O__fLQvgIwqRMRHUu11qKiP9-UYXXlMEIAlPGJQORrJ4xGv1pm0qGgLeqa0hPVAHYjBQVPsnn73iIo1V5oKx7qCSs4uTSAxfQGoiseeI-2vA0fMpzaPRsfWMVJj55DHF1g1dkHD7TMHHDVULPEWOy92Ya3MBQugutPIH7uh_ZypjWTzqDaA6IPwbkDMjtATI4xfhQirq3uPQNv1GKvi3uHqVdxChE3arxI6HOfLkExfm3nxoFEvM8sgTtwdormcFyryBmUfrDU3Ln1qiPrVGMdTB3OegNSw9iG4-Y9BpPYR8wafJBCqw53lUzC104pycE27A6djVg6JcldsBb1BQp3wI5iB7XlFxUHL5f7-Sua6oZGnQwYoamZxQcAKVymgfe7w0DwNEzjUG7O9rNbtwhzdQXRcKShdZ0zsFLYPKB5babP4yBi0mb0SJuomczCbeVQwrrC9fPxfp--Y1Xgc6ZA0cRA3aweLLLBzVEuRRYMNpWRuX5ASGpG5CKLma5z4EPLmipl-15Y42_LaQKA5iiObIKD8O7b-Pg6WqP8EzUkPVLR_TxEtdVCxivhcheaNJz-D_ke8hKGk8Pg8bE4XnPsEoU3JsCkpp8TKranThKIhE2fxPZth9EPhen3PDIo1m2oaNrjqQhFrQ2ehZ4qFUjOJlR8_MwBaiyKc67Pibl5TZisYhDGQYy5MQ2Op89ykg2c3OrwwqTvm4K2ktfn-VYz9YI-IyRZTXyGC9zvEO89PQ3P2e4E8KGzQDfGydgSeo03JCk-8epNLX8c_pHKxCJwseQ_Bg5qxU4JIpjxHim0OQ8cCmreduFOaIKXld5fTQOanfXspeEHZvA7aLW8MXO-XoGa0J1ccssUmkGlFuJ98zqvpmrVqmyT0nZ3lTs8-_d51kkqWJnOhvl6O2_0MSJFKiSfQS7ps-FOkvbLksF8j9h0bnaZuLSC1r4EdMhdAALNmce4mOLEtoUntFnqMKPbtdYXUmhAfW7xvYeGsDuSYS8E0O14DENvzM8Lx55MR5ytueAsHN6Qe2rTDIOVZ4-c-FjNW4wQoj1kPSkU1kpEosiapIY8SX9Q_wM9TXSg4KMIQqqEkTJPDtn0LcKGXvI2Lh5VcwHeF5bLZuPJLkO7BnWZoulfqJL-HIgiT9abwL3y-O06YeBe0tJj6E--DUu8Er3H7isl31lClz6_x-Hy0wHZFZHLNkSuxXkaEENmrAoblVu-q2gz_TSQfgFmOBTDmRt0t3QE-0o4DMuJXpIWpkCMeoza3e0S5MLx6McyiyPm2NVFGhpv9LSBjZlx99pWEW03D82MWw_eRSgkWkTC8Ehw9GypnOHxS2gvb3oLE6BlNUxC8KO4LPZL7B5dKOILsqTguY54OtWzjgvUV0lbErCpHOBJlYbioMwWa9sbl1frBLs60ybh2IHcUr0b2baQr5uxr3BRBn48BDh_B5RyuyHweFdI49tIs3tBhklzmZoMi9WHZWw0T9IONbkulBdbBpvHbuQWyDUgvFcJsRa9OFq3TOvLUXBnmSYM7V2wkQ2hGxQubStxh7wBUXMkYQnwEZqHdupJvC7p5yPMcrM9nqwNpWUKwQ0nrJGJSTPLE4fZOVST4BBWe_5U3bOk7RRearhqRkrr3HCbom9VuRj2d9okcqM4VRzYCoQxNDKkozdELM-syAx82mgZM-fyYTRhKaJRCfIaqCl41dFXB4c2bBWAVuNtcWFiVrPPraQNDvPgGm7wwoL92BVbBkD5zb5qaDZbBi4y-PeeAD166rxHcoIVHdSbuWzY9MOLrd-gHRFjTw-nGT2AZxVP80QFpm9XkfINN-pc4jD1o6i9NOfcvZOc07aOFPFli6BzEx9OXOvA0qSYZOJJS2cHrIZ4Z6EwAMKqdPN2eveA3MnL-gxY6hcgpXT1C7-F6E6HAyXb7M4CQ79mQpGfL6sx1sa85ET7kfbkH_4rcWE07G1Jktu6SxRA-PQ4Yj2vb5fld5ixcNgZ4nsqyK8Gm0hPYXkAMK5VY-vx2x7Siqj5bTnHx_iCW_B9S0-ODyBjQCs2plFKVanjx2V8GiSZyChyKvHiInHAR-g7LnRCQ5LlsYh4dS79Ur9QHm3Jb9iHKOwWyPyGTLSI64FBTOLBv26D3BUXJCJKYiwKlm2QevNdwPWb5B169SuHtUNflGZZFW_jx4aGjuzUTfS30awLWojc3wlRs1rF1rvd4XCaXYVnkuw-fGLt24aiLoUvWGaHGEsG1CXzQe-bxR0Qv35a6aO7B963hcZz_dLaMGISBpPD0GGUGJPe1hDN0SZxE4b4-F7JRLiEZhkB6l2k0w1jM-TquhxQ3yOq-882zHlFfiyKcm9UjipJq6gz4lLdKejZ7_Pt-uuvP__6w63PvE9a8fxqmmWQH38xnCE1eQNzDxRoGb69JIo7Zyy4VeTjI2UJEsqhldAh1fLqEZnIhCDvRvz-WQ1sr-EdbiRpmo1vkI_1XENpHnVU5PgW9SlK0r8sXrk8U0SHb910BhOJW9mn9l3pMdiN02gUdh-9LPX6HcG66YZ_CI3ArHZ9WrTnAoVfLPZ7q_jwCZ096Najbr59Hv3ajuyLJa41MsJfQnFTZ-3DpP5Y-jTG5-y-H3DyLQ0Lobhqg_BWOSaZedQku2cRKXRB2ks4lNVUCIw2c6k8OcndOl9dx_PbxD8D6Eyh6nEehncj55D9MsNLE95G71WmNKd641GEpb2RwMde95qzxFZGjVUQ-wfmZ66LVfn8UKY1DM7Gl2gBJqyXp3_iSTmZv6e8phrT_ViL39gBbQorq87N8ddu9F--NWIHtYP1hlWqopfRq-pDR-LhmPLSy4WJEwagJ3AFx1JTTARdXZLnaycDsgT9LZN0USW_QiDcVbR-oPPRk9_lKTi5bmjPt4HPzz7eSkNFoPjM0AlDvnGRkWnsp5O3CrxBgLQfUYKzNmuCBWTiaBtWCpN32uNahofo-qzJ6X5l_DYp5QOyRq-Zd1GyU3I-28c_6oROJ5RAvEKbeGCtnrGPgib39B0k-W2AmendkPfBtPZQcSmvWs-6Psq9BaFrb6ilFUqT5L9w5Gr5CziQwhJBiVZc842lrbrrDspGo-cZVhm2STqsL345IxgU07SjsCKwAywNz_-f8d__AQ1HAmOaDAAA",
    "tokenId": "02ee3057-72a9-4a22-92b8-6de608135524",
    "expiration": "2019-03-05T03:05:36Z"
}
```