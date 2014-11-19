
Then /^the user with email "(.*?)" has overlord: user with email: "(.*?)"$/ do |vassal_email, overlord_email|
  vassal   = User.find_by email: vassal_email
  overlord = User.find_by email: overlord_email
  expect(overlord.vassals).to include(vassal)
  expect(vassal.overlord).to eq(overlord)
end