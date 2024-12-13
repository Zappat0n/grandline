class DeepInfra::Client
  URL = "https://api.deepinfra.com/v1/openai/chat/completions"
  MODEL = "meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo"

  def call(question)
    response = Faraday.post(URL) do |req|
      req.headers["Content-Type"] = "application/json"
      req.headers["Authorization"] = "Bearer #{Rails.application.credentials.deep_infra[:token]}"
      req.body = {
        model: MODEL,
        messages: [
          {
            role: "user",
            content: question
          }
        ]
      }.to_json
    end
    JSON.parse(response.body)
  end

end
