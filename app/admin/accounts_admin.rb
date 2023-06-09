Trestle.resource(:accounts) do
  menu do
    item :accounts, icon: "fa fa-star"
  end


  scope :all, default: true
  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :number
    column :category
    column :balance
    column :created_at, align: :center
    column :deactivated

    # column :active do |accounts|
    #   if accounts.deactivated
    #     actions do
    #       # Create a "Deactivate" button that sends a PUT request to the deactivate action
    #       link_to "Deactivate", accounts_admin_path(:accounts, account, :deactivate), method: :put
    #     end
    #     status_tag "Active", :success
    #   else
    #     status_tag "Inactive", :danger
    #   end
    # end

    column :active do |account|
      if account.deactivated?
        status_tag "Active", :success
      else
        link_to "Activate", accounts_admin_path(account), method: :put
      end
    end


    column :status do |account|
      if account.deactivated?
        link_to "Deactivate", accounts_admin_path(account), method: :put
      else
        status_tag "Inactive", :danger
      end
    end

     actions
  end



  # Customize the form fields shown on the new/edit views.
  #
  form do |account|

    tab :account do
    text_field :name
    number_field :number
    text_field :description
    text_field :normal_side

    select :category, [
      ["", "blank"],
      ["Asset", "asset"],
      ["Liability", "liability"],
      ["Equity", "equity"],
    ]

    select :subcategory, [
      ["", "blank"],
      ["Asset", "asset"],
      ["Liability", "liability"],
      ["Equity", "equity"],
    ]

     row do
      col { datetime_field :created_at }
    end

    end

    tab :statement do
    # Able to show decimal but not 2 deciimal spaces
    # Needs to be fixed
    number_field :initial_balance, step: :any
    number_field :debit, step: :any
    number_field :credit, step: :any
    number_field :balance, step: :any


    number_field :id
    number_field :order

    select :statement, [
      ["", "blank"],
      ["Income Statement", "is"],
      ["Balance Sheet", "bs"],
      ["Retained Earnings Statement", "re"],
    ]

    text_field :comment
    end
  end



  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:account).permit(:name, ...)
  # end
end
