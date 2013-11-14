select xt.create_view('xt.receivable_applications', $$

  select arapply.*,
    arapply_source_aropen_id as parent_id,
    arapply_source_doctype as document_type,
    arapply_source_docnumber as document_number,
    arapply_applied as base_amount
  from arapply
  union
  select arapply.*,
    arapply_target_aropen_id as parent_id,
    arapply_target_doctype as document_type,
    arapply_target_docnumber as document_number,
    arapply_applied as base_amount -- amount in base currency
  from arapply

$$);