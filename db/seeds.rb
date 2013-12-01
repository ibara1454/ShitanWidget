# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

json = nil

File.open('db/index.json', 'r') do |file|
  json = JSON.load(file)
end

Mime = SearchMissive::Mime
Document = SearchMissive::Document
Attachment = SearchMissive::Attachment
AcceptDate = SearchMissive::AcceptDate
Agency = SearchMissive::Agency
Initial = SearchMissive::Initial
DocType = SearchMissive::DocType
Missive = SearchMissive::Missive

json.each do |entity|
  # avoiding same missives
  next if Missive.where('reference_no = ? AND subject = ?', entity['reference_no'], entity['subject']).first
  #
  entity['document'] =~ /attach\/(.*)$/
  path = $1
  type = MIME::Types.type_for( path ).first.to_s
  mime = Mime.where( :name => type ).first || Mime.create( :name => type )
  document = Document.where( :path => path ).first || Document.create( :path => path, :mime => mime )
  date = entity['accept_date'].to_date
  accept_date = AcceptDate.where( :date => date ).first || AcceptDate.create( :date => date )
  dtype = entity['doc_type']
  doc_type = DocType.where( :name => dtype ).first || DocType.create( :name => dtype )
  age = entity['agency']
  agency = Agency.where( :name => age ).first || Agency.create( :name => age )
  init = entity['initial']
  initial = Initial.where( :name => init ).first || Initial.create( :name => init )

  missive = Missive.create( :accept_date => accept_date, :doc_type => doc_type, :agency => agency, :initial => initial, :reference_no => entity['reference_no'], :subject => entity['subject'], :document => document )

  unless entity['attach'].empty?
    entity['attach'].each do |a|
      a =~ /attach\/(.*)$/
      path = $1
      type = MIME::Types.type_for( path ).first.to_s
      mime = Mime.where( :name => type ).first || Mime.create( :name => type )
      attachment = Attachment.create( :path => path, :mime => mime, :missive => missive )
    end
  end

end