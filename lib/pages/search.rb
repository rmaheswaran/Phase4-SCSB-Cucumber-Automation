
class SearchPage
  include PageObject

  #page_url ENV['URL']

  #page_url"http://dev-recap.htcinc.com:9090/search"
 # page_url "http://uat-recap.htcinc.com:9090/search"
 # page_url "http://tst-recap.htcinc.com:9090"
  #Search page

  text_field       :txt_search_box,                                 :id => 'fieldValue'
  div              :checkbox_ownInstId,                             :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[2]/div[2]/div/div[1]"
  div              :checkbox_cgdId,                                 :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[3]/div[2]/div[1]"
  div              :checkbox_availabilityId,                        :xpath => 'html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[3]/div[2]/div[2]'
  div              :checkbox_materialTypeId,                        :xpath => 'html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[2]/div[2]/div/div[2]'
  select_list      :drdown_fieldName,                               :id => 'fieldName'
  button           :btn_search,                                     :id => 'search'
  button           :btn_use_restriction,                            :xpath => 'html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[3]/div[2]/div[3]'
  button           :btn_resetSearch,                                  :id => 'resetSearch'
  button           :btn_nextbutton,                                 :xpath => "//a[contains(.,'Next')]"
  button           :btn_lastBottom,                                 :id => 'lastBottom'
  div              :table_searchResultsDiv,                         :id => 'searchResultsDiv'
  span             :image_showFacetsIcon,                           :id => 'showFacets'
  image            :image_clearSearchText,                          :class => 'add-clear-x'
  link             :tab_collection,                                 :class =>'tab-collection'
  #Searchpage--checkboxes----
  checkbox         :chck_owningInstitutionNYPL,                     :id => 'owningInstitutionNYPL'
  checkbox         :chck_owningInstitutionCUL,                      :id => 'owningInstitutionCUL'
  checkbox         :chck_owningInstitutionPUL,                      :id => 'owningInstitutionPUL'
  checkbox         :chck_shared,                                    :id => 'shared'
  checkbox         :chck_private,                                   :id => 'private'
  checkbox         :chck_open,                                      :id => 'open'
  checkbox         :chck_available,                                 :id => 'available'
  checkbox         :chck_notAvailable,                              :id => 'notAvailable'
  checkbox         :chck_noRestriction,                             :id => 'noRestriction'
  checkbox         :chck_inLibraryUse,                              :id => 'inLibraryUse'
  checkbox         :chck_supervisedUse,                             :id => 'supervisedUse'
  checkbox         :chck_monograph,                                 :id => 'monograph'
  checkbox         :chck_serials,                                   :id => 'serials'
  checkbox         :chck_others,                                    :id => 'others'

  #Search Result
  button           :btn_request,                                    :xpath =>"html/body/section/div/div/div/div/div/form/fieldset/div[2]/div/div/div[2]/div[4]/div[2]/button[2]"
  button           :btn_export,                                     :id => 'export'
  span             :txt_searchResultsMsg,                           :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div[2]/div/div/div[2]/div/div/span[2]"
  span             :txt_alert_alert_info,                           :xpath => ".//*[@id='search-form']/fieldset/div[2]/div/div/div[2]/div/div/span[2]"

                                                                             
  link             :lnk_title_of_bib,                               :id => 'searchResultsDataTitleS-2'
  div              :tbl_bib_detail_page,                            :id => 'marcRecordViewDivId'
  div              :txt_total_value,                                :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div[2]/div/div/div[2]/div[2]/div[3]/span[1]/span"
  checkbox         :chck_NYPL,                                      :id => 'owningInstitutionNYPL'
  checkbox         :chck_CUL,                                       :id => 'owningInstitutionCUL'
  checkbox         :chck_PUL,                                       :id => 'owningInstitutionPUL'
  checkbox         :chck_selectAllFacets,                           :id => 'selectAllFacets'
  select_list      :chck_numOfRecordsId,                            :id => 'numOfRecordsId'
  table            :tbl_searchResultsDataPlus24,                    :id => 'searchResultsDataPlus-24'
  table            :tbl_searchResultsDataPlus49,                    :id => 'searchResultsDataPlus-49'
  table            :tbl_searchResultsDataPlus99,                    :id => 'searchResultsDataPlus-99'
  image            :image_showItemsIcon,                            :id => 'showItemsIcon-5'
  table            :tbl_searchItemResultsRow5,                      :id => 'searchItemResultsRow-5'
  span             :btn_show_facts,                                 :id => 'showFacets'
  div              :facts_window,                                   :id => 'search-filter'

  #-------------------------------------------------------------------------------------
  text_field     :password,                                :xpath => "//input[@type='password']"
  button         :continue,                                :class => 'box-submit'
  link           :lnk_forgot,                              :class => 'small-text'
  text_field     :int_forgot_email,                        :class => 'form-control'
  div            :txt_alert_msg,                           :class => 'alert-success'
  link           :lnk_logout,                              :class => 'logout'

  link          :tab_search,                               :class => 'tab-search'
  link          :tab_collection,                           :class => 'tab-collection'
  link          :tab_request,                              :class => 'tab-request'
  link          :tab_reports,                              :class => 'tab-reports'
  link          :tab_role,                                 :class => 'tab-role'
  link          :tab_user,                                 :class => 'tab-users'



  def get_valid_barcode
    btn_show_facts_element.click
    sleep 2
    click_facts('Out')
    sleep 1
    click_facts('Private')
    sleep 2
    click_facts('Serials')
    sleep 2
    click_facts('Others')
    sleep 2
    btn_search
    sleep 5
    wait_until(60, ""){table_searchResultsDiv_element.visible?}
     barcode = []

    i = 0
    begin
      barcode << span_element(:id=>"searchResultsDataBarS-#{i}").text rescue nil
      i= i+1
    end while i <=15
    barcode = barcode.reject{|i| i.empty?}
=begin
    barcode = span_element(:id=>"searchResultsDataBarS-0").text
    if barcode == ""
      barcode = span_element(:id=>"searchResultsDataBarS-1").text
      if barcode ==""
        barcode = span_element(:id=>"searchResultsDataBarS-2").text
        if barcode == ""
          barcode = span_element(:id=>"searchResultsDataBarS-3").text
          if barcode ==""
            image_element(:id=>'showItemsIcon-0').click
            barcode = span_element(:id=>'searchItemResultsDataBarS-0-0').text
          end
        end
      end
    end
=end

    if barcode.empty?

      j=0
      begin
        sleep 2
      image_element(:id=>"showItemsIcon-#{j}").click rescue nil
        sleep 2
      barcode << span_element(:id=>"searchItemResultsDataBarS-0-#{j}").text rescue nil
        j=j+1
      end while j <= 15
      barcode = barcode.reject{|i| i.empty?}
    end

    return barcode.sample
    puts barcode
  end

  def login_driver_portal
    driver_valid_credentials = TestData.driver_portal_login_details
    populate_page_with driver_valid_credentials
    continue_element.click
  end

  def login_with_invalid_credential_for_dp
    driver_invalid_credentials = TestData.dp_invalid_credentials
    populate_page_with driver_invalid_credentials
  end

  def login_management_website
    management_site_credential = TestData.management_site_credentials
    populate_page_with management_site_credential
    btn_sign_in_element.click
  end

  def switch_browser_title(txt_switch_window)
        #create a array with window_id and its corresponding window page title
        wnd_titl = @browser.window_handles.map do |w|
          @browser.switch_to.window(w)
          [w,@browser.title]
        end
        #required window
        win_id = wnd_titl.find { |e1,e2| e2 == txt_switch_window }.first
        @browser.switch_to.window(win_id) #switched to the required window
        @browser.manage.window.maximize
  end


  def click_facts(txt_name)

    facts = div_elements(:class=>'checkbox')

    facts.each do |element|
      if element.label_element.text.upcase == txt_name.upcase
         element.label_element.span_element.click
         break
      end
    end
  end

end

