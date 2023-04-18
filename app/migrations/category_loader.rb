require 'csv'

class CategoryLoader
  def process
    mappings = CSV.open('./category_mappings.csv')
    mappings.each do |row|
      category = nil
      if row[8].blank?
        if row[10].blank?
          category = Viking::Category.new(category_name: row[7].gsub(/[[:space:]]*$/, ''),
                                          created_by: 'johnf',
                                          updated_by: 'johnf')
        else
          category = Viking::Category.new(category_name: row[7].gsub(/[[:space:]]*$/, ''),
                                          parent_category_id: row[10].to_i,
                                          created_by: 'johnf',
                                          updated_by: 'johnf')
        end
      end
      unless category.nil?
        category.save!
        puts "#{category.category_name} - #{category.id}"
      end
    end
  end
end
