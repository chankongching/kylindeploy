#!/bin/bash

./runchefclientdocker.sh kgtest3 '
{
  "deploycode":{
    "basedirectory":"/root/tools/code/",
    "configuration":{
      "azure":{
        "scheme":"",
        "action":"create",
        "credentials":{
          "token":[
            {
              "tokenType":"Bearer",
              "expiresIn":3599,
              "expiresOn":"2017-06-16T11:59:16.820",
              "resource":"https://management.core.chinacloudapi.cn/",
              "accessToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im0yZmFQUUZkQzFEVGRmWU1pb09kaHdSblFUMCIsImtpZCI6Im0yZmFQUUZkQzFEVGRmWU1pb09kaHdSblFUMCJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuY29yZS5jaGluYWNsb3VkYXBpLmNuLyIsImlzcyI6Imh0dHBzOi8vc3RzLmNoaW5hY2xvdWRhcGkuY24vNDQyMDEwNDAtOTY2Ny00NDYyLTgzYjktZmZhZTdkZDdhZjE2LyIsImlhdCI6MTQ5NzYxMDQ1NywibmJmIjoxNDk3NjEwNDU3LCJleHAiOjE0OTc2MTQzNTcsImFjciI6IjEiLCJhaW8iOiJBU1FBMi84QUFBQUE0c2s3cXU3K0FhelBCcU41VC9XaTNDc3dScys4TDVwa3RkbGFvRFdFdmprPSIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJmOWUxMmRlMC05MmVjLTQ0NGQtYjA4Ni1iZWFjNWE3NzgzOWIiLCJhcHBpZGFjciI6IjEiLCJlX2V4cCI6MjYyODAwLCJmYW1pbHlfbmFtZSI6IuWImCIsImdpdmVuX25hbWUiOiLlh6_mrYwiLCJncm91cHMiOlsiOWYzM2E4ZjktODAwZC00YmViLWIyY2EtMThkODJhMDg1YmZkIl0sImlwYWRkciI6IjQ3LjkwLjQxLjEyOSIsIm5hbWUiOiLliJjlh6_mrYwiLCJvaWQiOiI0ZGU2Y2E0OC0xZDBhLTQ3NjMtYjgxMC0xYzJlMWE5YzY2NTUiLCJwbGF0ZiI6IjUiLCJwdWlkIjoiMjAwM0JGRkQ4MTNGM0MwRSIsInNjcCI6InVzZXJfaW1wZXJzb25hdGlvbiIsInN1YiI6IjMyZzVBWm1tMFpCU2Q0aG53LXMzZ240cnJiLW5WQS1iZndiUm0yOFdzSlEiLCJ0aWQiOiI0NDIwMTA0MC05NjY3LTQ0NjItODNiOS1mZmFlN2RkN2FmMTYiLCJ1bmlxdWVfbmFtZSI6ImthaWdlLmxpdUBreWNsb3VkLnBhcnRuZXIub25tc2NoaW5hLmNuIiwidXBuIjoia2FpZ2UubGl1QGt5Y2xvdWQucGFydG5lci5vbm1zY2hpbmEuY24iLCJ2ZXIiOiIxLjAifQ.QUTLQIvu57UpmPCM7BLbBAI_3y0ECix-ujW8uPWmM7uJ2rAQSGpmXunDFe-QDbPQ49rDLTsStl4YBD30JfNXwd3PHJibDe7lCJgCtV8LAWfaaUNLFWjF_mkFqfbW_2STYp9D5ccHQjj8OIc0TqrJUc2HTMNnXWDenffD68XJ1qPvCnUwuzgzrkt5SJSK9mjuujnV9rVemCf5QEdi38SGoBKLu-N22Jsx_z11qh1JiicZy7pc2SMgwNb3fEdECYrJykiuyswRJae6K5WQZWR8yjfUxYM8-KdqDQoNUbuhu8HCqCWrbYlZ9X3Q95MzxhHheg8GNMQ3SyBhHK554ktCsg",
              "refreshToken":"AQABAAAAAACrHKvrx7G2SaZbZh-tDnp7Kbtmv0zbwBJr9Kn_m1rt242PjWal-s5IeuQCCjpJDTNo72nWDasHid5Cw0UuBF_XUBSQDYnjTYjXqc9Whxm1U7IBqO--oqSHrYk139Pm0k77Ya471B7GbtuQ-52XM-eiu_hm-jz0aZn-wIkJtzsenDhIv8KkfZQFrdQh6KkgdwOvJXjF2JEAKaSafal5LLKs87qClrnjG-pfnp2Mm6LfGEWqD2nFXs6BwVDgy6C_0eFsVJf-oIa4Q-W_O5BzwrPlUGjugyV7hcFYCtI-QOg4tUh6wtFZM1DXc2ACqIz4FEWYdEqi-tGIKwewdlJPBYX30WrKnTFkMEetGQHdYDGIb-a-Wd5h0eupzCFFAb_yMLXkTU6uHHfBJns8ho0nXwwDTY8Ec-Uxy8oFkcq4HY2Z8R7gfqUoiXgDokR09dKUZ4E_Ik-S_zQghxWgzbIpCCmbF8HKKyPXYTBdfYCmiCMlFmQtzHzd4dD24wSLYv5_m9pv6Sh9_s4kv9D_eqoAa01sXjn0dOfcp2QXR5OiY9c0LRvNWMfMvsyeCPVy_g9Zh00ABnKHtq3mtqeE0XqaBLn0a3NopdqIMJRd8-PqZBjssAuD_uNkKRc-Uxghqt8nsqtUJ-pJHjbK078OAY7pxC4bPZLrrB4Kwy7bVxcvQXZeLOokB2F8EuB4PpjQdvnVbwhKFrfJQGBGI42AM9_dc_GQ2nUd2N1ngFSbn52fS0tjMs5-8uoPdyCLkzyvLkXlpx8vNePAS5SY6fPwIt721SnMIAA",
              "userId":"kaige.liu@kycloud.partner.onmschina.cn",
              "oid":"4de6ca48-1d0a-4763-b810-1c2e1a9c6655",
              "_clientId":"04b07795-8ddb-461a-bbee-02f9e1bf7b46",
              "_authority":"https://login.chinacloudapi.cn/common",
              "mrrt":true,
              "isMRRT":true
            },
            {
              "tokenType":"Bearer",
              "expiresIn":3599,
              "expiresOn":"2017-06-16T11:59:17.097",
              "resource":"https://management.core.chinacloudapi.cn/",
              "accessToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im0yZmFQUUZkQzFEVGRmWU1pb09kaHdSblFUMCIsImtpZCI6Im0yZmFQUUZkQzFEVGRmWU1pb09kaHdSblFUMCJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuY29yZS5jaGluYWNsb3VkYXBpLmNuLyIsImlzcyI6Imh0dHBzOi8vc3RzLmNoaW5hY2xvdWRhcGkuY24vNDQyMDEwNDAtOTY2Ny00NDYyLTgzYjktZmZhZTdkZDdhZjE2LyIsImlhdCI6MTQ5NzYxMDQ1NywibmJmIjoxNDk3NjEwNDU3LCJleHAiOjE0OTc2MTQzNTcsImFjciI6IjEiLCJhaW8iOiJZMkJnWVBnV2Y1U0piMGJRWmVmZ2lUMHJablJhN3ZxdTF2WGE5SGFjWXgvWDFyYWIva3NCIiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6ImY5ZTEyZGUwLTkyZWMtNDQ0ZC1iMDg2LWJlYWM1YTc3ODM5YiIsImFwcGlkYWNyIjoiMSIsImVfZXhwIjoyNjI4MDAsImZhbWlseV9uYW1lIjoi5YiYIiwiZ2l2ZW5fbmFtZSI6IuWHr-atjCIsImdyb3VwcyI6WyI5ZjMzYThmOS04MDBkLTRiZWItYjJjYS0xOGQ4MmEwODViZmQiXSwiaXBhZGRyIjoiNDcuOTAuNDEuMTI5IiwibmFtZSI6IuWImOWHr-atjCIsIm9pZCI6IjRkZTZjYTQ4LTFkMGEtNDc2My1iODEwLTFjMmUxYTljNjY1NSIsInBsYXRmIjoiNSIsInB1aWQiOiIyMDAzQkZGRDgxM0YzQzBFIiwic2NwIjoidXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiMzJnNUFabW0wWkJTZDRobnctczNnbjRycmItblZBLWJmd2JSbTI4V3NKUSIsInRpZCI6IjQ0MjAxMDQwLTk2NjctNDQ2Mi04M2I5LWZmYWU3ZGQ3YWYxNiIsInVuaXF1ZV9uYW1lIjoia2FpZ2UubGl1QGt5Y2xvdWQucGFydG5lci5vbm1zY2hpbmEuY24iLCJ1cG4iOiJrYWlnZS5saXVAa3ljbG91ZC5wYXJ0bmVyLm9ubXNjaGluYS5jbiIsInZlciI6IjEuMCJ9.MA3GO42vxCsJ1A-EbUR2VfMjJXgNtRSIlWH1Xc_rRJu-0KNvPYipdEpWPQCY7F15qhD120nq-RqYuBRDy02jkiGuJUWY4ymhXq7zY6CrcBIQAxFqvzP-31aZGwq5vuwRftNOu3_XTckYTW0WnqAMlOB447lTv-Ru9raZ3u4TRXCJB6xbpTwe7eKEpMzPG00NAv3h9NJhPPfGLN2rW6oWLI0aGWlj6-onsQ61_oUSyVFIn3EYtOpkjOAai_WnJJcr7LuvJ7H10T1d9JIQKU-idcbsBhdBbkYpZdF566HJbqw3wOWmLNGIV74mfjhXEkEbtHF5YSL3kjlPvGo-pIa1Iw",
              "refreshToken":"AQABAAAAAACrHKvrx7G2SaZbZh-tDnp7mxdJZJ88wo7RfE8JwDAFH35rXVq3GRfqlMQPEAtqhDGuaqDc2VYix2_V4lAtAQcRVnkZ6EOzVvSt3mItgMd64Fi-TGB77bj8pMKaLocbACnyg7rhyk0i8dCRYcsxrnYR82IAbn9MTNtZiYL1Xbvt54Gr-1MbnQALrq3YLyoJ541Wg6k-siguynD7Z4WJQ1vK7tkh1XfpU0UnrR0xVMfL6ZRV_eM0qfkUmaYeDQWiT4T6xJx9Ey_vfgkK3aYaPU53cbpu50vEcKOSfLrDX9trWIIjb0-5M3tB-QqL8t-4QH9i6nzTSON-JVjMCo_fcVTgGhMFxzDiijh0xHE7FrxZ1sX_yqkcun6ZRIvmyCya0HP7gKBS4EmmFSFKXYlKaSbpBhYZ2UTrLnrT3fddo4Lyv2zjzhoh8gvMicPMEAtYoh_bvQN-hd-WoW7SoNVL1SIvKcNYu-NlSVHbAAUIwkct2lad3PVSkMBKgxK4UdCAJLpTkk2UV73fO6755xULoAxXRoDYwCzuB75AoE8BLAmSMB2Oh2HK-uRbnSdbzPstGpcqtz56Cz5WhBGRhKSj9dXmY4i_pz4-T6UxPx2ppys5f74NB2NZVZyLoFTC8hy7iUbV4EuMYc3iA-ThKyHij7I9-ZKo7Bf6T0Q6lV9ynLV2Rl35Q0W5R57AGk8S6q71tlr1fdiG-KvoD41IQ4ruAVQ1lTU-muw_X7yJ7e6pKQ1dAjiuSV6Z08qcSdv2XoPxgt_0OwbCGcmmp__5zMRhvyHvIAA",
              "userId":"kaige.liu@kycloud.partner.onmschina.cn",
              "oid":"4de6ca48-1d0a-4763-b810-1c2e1a9c6655",
              "_clientId":"04b07795-8ddb-461a-bbee-02f9e1bf7b46",
              "_authority":"https://login.chinacloudapi.cn/44201040-9667-4462-83b9-ffae7dd7af16",
              "mrrt":true,
              "isMRRT":true
            }
          ],
          "profile":{
            "environments":[

            ],
            "subscriptions":[
              {
                "id":"64b57128-3cf9-4e29-8454-ce791c9d0945",
                "name":"Microsoft Azure Enterprise ???",
                "user":{
                  "name":"kaige.liu@kycloud.partner.onmschina.cn",
                  "type":"user"
                },
                "tenantId":"",
                "state":"Enabled",
                "isDefault":true,
                "registeredProviders":[

                ],
                "environmentName":"AzureChinaCloud"
              }
            ]
          }
        },
        "kylin":{
          "identifier":"kgtest3",
          "region":"chinanorth",
          "kaptoken":"",
          "cluster":true,
          "appType":"KAP",
          "clusterLoginUserName":"kaige",
          "clusterLoginPassword":"Admin@2017",
          "clusterName":"c57586kgtest3",
          "clusterName2":"",
          "clusterType":"hbase",
          "clusterVersion":"3.5",
          "clusterWorkerNodeCount":2,
          "storageAccount":"c57586kgtest3sa",
          "storageAccount1":"",
          "storageAccount2":"",
          "containerName":"default",
          "edgeNodeSize":"Standard_D3",
          "metastoreName":"c57586kgtest3",
          "sshUserName":"kaige",
          "sshPassword":"Admin@2017",
          "vnetName":""
        }
      }
    },
    "localfolder":{
      "azure-cli":"nodownload"
    },
    "runtime":{
      "azure":{
        "tag":"latest",
        "image":"dockerpriv.kybot.io:5002/keithyau/azure-cli",
        "mountlocal":"localdir",
        "mountdocker":"/templates"
      }
    }
  }
}'
