describe "routing for categories" do
  it "routes the / to categories#index" do
    expect(get: "/").to route_to(
      controller: "categories",
      action: "index"
    )
  end
end
