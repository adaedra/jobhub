json.array! @openings do |opening|
  json.extract! opening, :id, :title, :company, :status
  json.active opening.active?
end
