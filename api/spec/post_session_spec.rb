require_relative "routes/sessions"

describe "POST/sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = { email: "tsaboto@gmail.com", password: "pwd123" }

      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  examples = [
    {
      title: "senha incorreta",
      payload: { email: "tsaboto@gmail.com", password: "12345" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "usuario nao existe",
      payload: { email: "401@gmail.com", password: "12345" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "email em branco",

      payload: { email: "", password: "12345" },
      code: 412,
      error: "required email",
    },
    {
      title: "sem o campo email",
      payload: { password: "12345" },
      code: 412,
      error: "required email",
    },
    {
      title: "sem o campo senha",
      payload: { email: "tsaboto@gmail.com", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "campo senha em branco",
      payload: { email: "tsaboto@gmail.com" },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}"do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida id do usuario" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
