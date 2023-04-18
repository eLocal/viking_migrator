require 'csv'

class CategoryMappingLoader
  def process
    #purge existing mappings
    Viking::CategoryMapping.where(listing_source: 'ELOCAL').delete_all

    # create them all
    mappings = CSV.open('./category_mappings.csv')
    mappings.each do |row|
      next if row[4].blank?

      Viking::CategoryMapping.create(
        listing_source: 'ELOCAL',
        source_category: row[4].to_i,
        viking_category_id: row[8].to_i,
        created_by: 'johnf',
        updated_by: 'johnf'
      )
    end
  end
end
