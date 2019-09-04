$LOAD_PATH.unshift("json-api/app/serializers")
require "pry"
require "article_serializer"
# OR (if "$LOAD_PATH.unshift('json-api/app/serializers')" is not included)

describe ArticleSerializer do
  subject { described_class.new(article) }
  let(:article) { instance_double("Article", id: 678, title: "Bring Me The Horizon") }

  describe "#as_json" do
    let(:result) { subject.as_json }

    it "root should be article Hash" do
      expect(result).to match({
        article: be_kind_of(Hash),
      })
    end

    context "article hash" do
      let(:article_hash) { result.fetch(:article) }

      it "should contain id, type and attributes" do
        expect(article_hash.keys).to match_array([:id, :type, :attributes])
        expect(article_hash).to match({
          id: article.id.to_s,
          type: "articles",
          attributes: be_kind_of(Hash),
        })
      end

      context "id" do
        let(:article_hash_id) { article_hash.fetch(:id) }

        it do
          expect(article_hash_id).to be_kind_of(String)
          expect(article_hash_id).to eq("678")
        end
      end

      context "type" do
        let(:article_hash_type) { article_hash.fetch(:type) }

        it do
          expect(article_hash_type).to be_kind_of(String)
          expect(article_hash_type).to eq("articles")
        end
      end

      context "attributes" do
        let(:article_hash_attributes) { article_hash.fetch(:attributes) }

        it do
          expect(article_hash_attributes.keys).to match_array(:title)
          expect(article_hash_attributes).to match({
            title: /[Hh]orizon/,
          })
        end
      end
    end
  end
end
