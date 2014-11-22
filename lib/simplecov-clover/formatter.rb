require 'nokogiri'
require 'simplecov-rcov'

module SimpleCov::Formatter
  class CloverFormatter
    def format(result)
      # Generate coverage.xml
      clover_report(result)
      # Generate target/ HTML report
      SimpleCov::Formatter::RcovFormatter.new.format(result)
    end

    private
    def clover_report(result)
      now = Time.now.to_i
      builder = Nokogiri::XML::Builder.new do
        coverage(generated: now) {
          project(timestamp: now) {
            result.files.each do |file|
              file(name: file.filename) {
                file.lines.each do |line|
                  line(num: line.line_number, count: line.coverage || 0)
                end
                metrics(loc: file.lines.count, ncloc: file.lines_of_code, statements: file.lines_of_code, coveredstatements: file.covered_lines.count)
              }
            end
            metrics(elements: result.total_lines, coveredelements: result.covered_lines, ncloc: result.total_lines)
          }
        }
      end

      File.open(File.join(SimpleCov.coverage_path, "coverage.xml"), "w+") do |file|
        file.puts builder.to_xml
      end
      puts "Clover coverage written at #{File.join(SimpleCov.coverage_path, "clover.xml")}"
    end

    class SimpleCov::Formatter::RcovFormatter
      def self.output_path
        File.join(SimpleCov.root, "target/site/clover")
      end
    end

  end
end
