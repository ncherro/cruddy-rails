namespace :ach do
  desc "generates a sample Namely NACHA file that credits fund to a client's employee's account"
  task :generate_nacha => :environment do
    require 'ach'

    # Create ACH file
    ach = ACH::ACHFile.new
    trace_number = 0

    # File Header
    fh = ach.header

    # our ODFI's routing number
    fh.immediate_destination = '121140399'
    # our ODFI's name
    fh.immediate_destination_name = 'Chase Bank'
    # ODFI assigned 10-digit number (given when we are approved to originate ACH files)
    fh.immediate_origin = '3948259384'
    # our company's name
    fh.immediate_origin_name = 'NAMELY INC'

    # Batch
    batch = ACH::Batch.new
    bh = batch.header
    # our company's name
    bh.company_name = 'Company Name'
    # same as file header's immeditate origin: ODFI assigned 10-digit number (given when we are approved to originate ACH files)
    bh.company_identification = '3948259384' # Use 10 characters if you're not using an EIN
    bh.standard_entry_class_code = 'PPD'
    # description of transaction. will appear on receiver's bank statement
    # NOTE: using a string beyond the character limit does not give a validation error
    bh.company_entry_description = 'PAYROLLACHREALLYLONGDESCRIPTION'
    # date to id the transaction (YYMMDD). may be printed on receiver's bank statement
    bh.company_descriptive_date = Date.today
    # date transaction is posted to receiver's account -> tomorrow's date (YYMMDD)
    bh.effective_entry_date = ACH::NextFederalReserveEffectiveDate.new(Date.today).result
    # odfi routing - this number should match file header's immediate destination
    # NOTE: using a mismatched number does not give a validation error
    bh.originating_dfi_identification = '22114039'
    ach.batches << batch

    # Detail Entry
    ed = ACH::EntryDetail.new
    ed.transaction_code = ACH::CHECKING_CREDIT
    # RDFI routing number
    ed.routing_number = '221140399'
    # RDFI account number
    ed.account_number = '10987654321'
    ed.amount = 20000 # In cents
    ed.individual_id_number = '123456789'
    ed.individual_name = 'EMPLOYEE TO BE PAID'
    # odfi routing - this number should match the previously set originating_dfi_identification
    # NOTE: using a mismatched number does not give a validation error
    ed.originating_dfi_identification = '32114039'
    batch.entries << ed
    # ... Additional detail entries, possibly including *offsetting entry*, if needed.

    # Insert trace numbers
    batch.entries.each.with_index(1) { |entry, index| entry.trace_number = index }


    File.write('namely_ach.txt', ach.to_s)

    p ach.report
  end
end
