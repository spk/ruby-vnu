require File.expand_path('../spec_helper', __FILE__)

describe Vnu do
  it 'return cli' do
    Vnu.cli.must_equal "java -jar #{Vnu::JAR_PATH}"
  end

  it 'return cli version' do
    Vnu.cli_version.must_match(/^(\d){8}$/)
  end

  describe 'options' do
    it 'fail' do
      lambda { Vnu.new }.must_raise RuntimeError
    end

    it 'initialze stdin option' do
      stdin = '<!doctype html><title>'
      Vnu.new(stdin).command.must_equal "#{Vnu.cli} -"
    end

    it 'initialze vnu options' do
      stdin = '<!doctype html><title>'
      Vnu.new(stdin, errors_only: true, no_stream: true,
                  format: 'json', html: true, verbose: true).command.
                 must_equal "#{Vnu.cli} --errors-only --no-stream --format json --html --verbose -"
    end
  end

  describe 'validate' do
    describe 'fail' do
      it 'output default' do
        stdin = '<!DOCTYPE html><html><head><title>Test</title></head><body><ul><li id="1"></li><li id="1"></li></ul></body></html>'
        Vnu.validate(stdin).must_equal %(:1.90-1.90: error: Duplicate ID “1”.
:1.74-1.74: info warning: The first occurrence of ID “1” was here.)
      end

      it 'output json' do
        stdin = '<!doctype html><title>'
        Vnu.validate(stdin, errors_only: true, format: 'json').must_equal "{\"messages\":[{\"type\":\"error\",\"lastLine\":1,\"lastColumn\":23,\"message\":\"End of file seen when expecting text or an end tag.\"},{\"type\":\"error\",\"lastLine\":1,\"lastColumn\":22,\"message\":\"Unclosed element “title”.\"}]}"
      end
    end
  end
end
