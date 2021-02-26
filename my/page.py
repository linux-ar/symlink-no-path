import facebook

token = "EAANCLZAsNEQoBAO5CC3FuaLmc19zldajrD7gpbc6FnV6ZCeYi2nkVe5l1bwpqjknkNzakDlZChdGUlKtZAWFsR0puGZCU3kq33OidNBR7JbTVuJ4vLU09Xn6ZAukqDTtVQ67SzhKP4IfH7lepYY077A5KiGIg4dIZC5p9eGvFlndgZDZD" #@param {type:'string'}
graph = facebook.GraphAPI(token)
graph.put_object("me","feed",message = "Azure!")

