# API interaction with R

mygit <- oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "b1e5f29a1f1ffb8a9ed3",
                   secret = "1317631943dc656bbfbcf9933f3a0cd968723c15"
)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)
