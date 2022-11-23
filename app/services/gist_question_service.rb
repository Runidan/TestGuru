# frozen_string_literal: true

class GistQuestionService
  GistOnSite = Struct.new('Gist', :url, :name) do
    def success?
      url.present? || name.present?
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    answer = @client.create_gist(gist_params)
    GistOnSite.new(answer.url, answer.id)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_API'))
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
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
