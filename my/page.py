from poster.encode import *
from poster.streaminghttp import register_openers
import facebook

from poster.encode import *
from poster.streaminghttp import register_openers

def put_photo(self, source, album_id=None, message=""):
    object_id = album_id or "me"

    register_openers()
    content_type,body = multipart_encode( [ ('message',message),('access_token',self.access_token),('source',source) ] )

    req = urllib2.Request("https://graph.facebook.com/%s/photos" % object_id, content_type,body )

    try:
        data = urllib2.urlopen(req).read()
    except urllib2.HTTPError as e:
        data = e.read() 
    try:
        response = _parse_json(data)
        if response.get("error"):
            raise GraphAPIError(response["error"].get("code", 1),response["error"]["message"])
    except ValueError:
        response = data

    return response


token = "EAANCLZAsNEQoBAO5CC3FuaLmc19zldajrD7gpbc6FnV6ZCeYi2nkVe5l1bwpqjknkNzakDlZChdGUlKtZAWFsR0puGZCU3kq33OidNBR7JbTVuJ4vLU09Xn6ZAukqDTtVQ67SzhKP4IfH7lepYY077A5KiGIg4dIZC5p9eGvFlndgZDZD" #@param {type:'string'}
graph = facebook.GraphAPI(token)
# graph.put_object("me","feed",message = "Azure!")

photo=open("meme.png","rb")
graph.put_photo(photo, message = "Automated meme post")

