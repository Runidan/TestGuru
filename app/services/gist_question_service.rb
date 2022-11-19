class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_API'])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description:  I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        "#{I18n.t('services.gist_question_service.title', title: @test.title)}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
