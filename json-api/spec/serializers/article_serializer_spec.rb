$LOAD_PATH.unshift('.')
require 'rspec'
require 'json-api/app/serializers/article_serializer.rb'
# OR (if '$LOAD_PATH.unshift('.')' is not included)
# require './json-api/app/serializers/article_serializer.rb'

describe ArticleSerializer do
  subject { described_class.new(article) }
  let(:article) { instance_double(Article, id: 678, title: "Bring Me The Horizon") }

  describe "#as_json" do
    let(:result) { subject.as_json }

    it "root should be article Hash" do
      expect(result).to match({
                          article: be_kind_of(Hash),
                        })
    end

    context "article Hash" do
      let(:article_hash) { result.fetch(:article) }

      it "should contain type and id" do
        expect(article_hash).to match({
                                  id: article.id.to_s,
                                  type: "articles",
                                  attributes: be_kind_of(Hash),
                                })
      end

      context "attributes" do
        let(:article_hash_attributes) { article_hash.fetch(:attributes) }

        it do
          expect(article_hash_attributes).to match({
                                               title: /[Hh]orizon/,
                                             })
        end
      end
    end
  end
end
