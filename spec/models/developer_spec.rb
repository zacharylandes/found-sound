describe Developer do
  it "generates an api key" do
    user_1 = create(:user)
    user_2 = create(:user)
    developer_1 = create(:developer, user: user_1)
    developer_2 = create(:developer, user: user_2)

    expect(developer_1.key).to be_a String
    expect(developer_1.user).to eq(user_1)
    expect(developer_2.key).to be_a String
    expect(developer_2.user).to eq(user_2)
    expect(developer_1.key == developer_2.key).to be_falsy
  end
end
