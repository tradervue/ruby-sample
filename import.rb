require 'httparty'

class Import
  include HTTParty

  base_uri("https://www.tradervue.com/api/v1")

  def initialize(username, password)
    @auth = { :username => username, :password => password }
  end

  def status
    opts = {}
    opts[:basic_auth] = @auth
    resp = self.class.get("/imports", opts)
    puts resp
    if resp.code == 401
      return "access denied"
    end

    # status details about the last import in resp["info"]

    resp["status"]
  end

  def import_data(execs, tags)
    req = {
      :allow_duplicates => false,
      :overlay_commissions => false,
      :account_tag => nil,
      :tags => tags,
      :executions => execs
    }

    opts = {}
    opts[:basic_auth] = @auth
    opts[:body] = req
    resp = self.class.post("/imports", opts)

    if resp.code == 401
      return "access denied"
    end

    if resp.code == 200
      resp["status"]
    else
      resp["error"]
    end
  end

end
