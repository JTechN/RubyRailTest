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
    actions
  end



  # Customize the form fields shown on the new/edit views.
  #
  form do |account|
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

    # Able to show decimal but not 2 deciimal spaces
    # Needs to be fixed
    number_field :initial_balance, step: :any
    number_field :debit, step: :any
    number_field :credit, step: :any
    number_field :balance, step: :any

    row do
      col { datetime_field :created_at }
    end

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
