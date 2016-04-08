describe JsonTestData::JsonSchema do
  describe "#initialize" do
    let(:schema) do
      {
        :"$schema"    => "http://json-schema.org/draft-04/schema#",
        :type         => "object",
        :properties   => {}
      }.to_json
    end

    it "instantiates with a schema" do
      json_schema = JsonTestData::JsonSchema.new(schema)
      expect(json_schema.schema).to eql JSON.parse(schema, symbolize_names: true)
    end
  end

  describe "#generate_example" do
    describe "trivial examples" do
      context "when schema describes an object" do
        let(:schema) do
          JsonTestData::JsonSchema.new(
            {
              "$schema"    => "http://json-schema.org/draft-04/schema#",
              "type"       => "object",
              "properties" => {}
            }.to_json
          )
        end

        let(:output) do
          {}.to_json
        end

        it "generates an object" do
          expect(schema.generate_example).to eql output
        end
      end

      context "when schema describes an array" do
        let(:schema) do
          JsonTestData::JsonSchema.new(
            {
              "$schema" => "http://json-schema.org/draft-04/schema#",
              "type"    => "array",
              "items"   => []
            }.to_json
          )
        end

        let(:output) do
          [].to_json
        end

        it "generates an object" do
          expect(schema.generate_example).to eql output
        end
      end
    end

    describe "bigger examples" do
      let(:schema) do
        {
          :"$schema"  => "http://json-schema.org/draft-04/schema#",
          :type       => "object",
          :properties => {
            :name => {
              :type => "string"
            }
          }
        }.to_json
      end

      let(:output) do
        { "name" => "string" }.to_json
      end

      context "when schema describes an object" do
        it "generates the right object" do
          json_schema = JsonTestData::JsonSchema.new(schema)
          expect(json_schema.generate_example).to eql output
        end
      end
    end
  end
end