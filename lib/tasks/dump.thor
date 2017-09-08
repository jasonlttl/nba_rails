require 'thor/rails'
require 'active_record'
require 'axlsx'
#require_relative "../../lib/helpers/season_helper.rb"
#require_relative "../../app/services/nba_api/game_grab.rb"
#require_relative "../../app/models/game.rb"

class Dump < Thor
  include Thor::Rails

  desc "excel", "dumps database to excel"
  def excel
    Axlsx::Package.new do |p|
      ['City', 'Team', 'Player', 'Referee', 'Game', 'GameReferee', 'Lineup', 'Play', 'ShotChart', 'StatLine', 'TrackingStatLine', 'AdvancedStatLine'].each do |model_name|

        # Get model and data
        model = Object.const_get(model_name)
        columns = model.column_names.map { |c| c = c.to_sym }
        data = model.all

        p columns.inspect

        p.workbook.add_worksheet(:name=>model_name) do |sheet|
          # Add labels
          labels = columns.map { |c| c.to_s.humanize }
          sheet.add_row(labels)

          # Iterate over data rows
          data.each do |r|
            row_data = columns.map do |c|
              if c.to_s =~ /\./
                v = r; c.to_s.split('.').each { |method| v = v.send(method) }; v
              else
                r.send(c)
              end
            end
            sheet.add_row row_data
          end

        end
      end
      p.serialize('nba_data.xlsx')
    end

  end




end
