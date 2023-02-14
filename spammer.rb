require "httpx"

a = []

def get(*args)
    print(*args)
    gets
end

username = get "Username: "
contents = get "Message: "


def Post(url,username,content)
    while true do
        response = HTTPX.post(url, :json => {'username' => username, 'content' => content})
        puts response.body if response.status == 201
    end
end


# File.readlines('webhooks.txt').each do |line|
#     puts line.strip
#     puts line.strip
#         t1 = Thread.new do
#             Post(line.strip,username,contents)
#         t1.join
#     end
# end

threads = []


File.readlines('webhooks.txt').each do |line|

    threads << Thread.new {  Post(line.strip,username,contents) }
           
end

threads.each { |thr| thr.join }
