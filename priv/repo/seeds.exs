# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RpgServer.Repo.insert!(%RpgServer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias RpgServer.Game

skill_data = [
  %{
    name: "shield_charge",
    initiative: 50,
    tooltip: "Move to a space up to three hexes away.  Then, stun an adjacent enemy.",
    actions: [
      %{
        name: "shield_charge_move",
        modifier: 1.0,
        order: 1,
        range: 3,
        type: "move"
      },
      %{
        name: "shield_charge_stun",
        modifier: 1.0,
        order: 2,
        range: 1,
        type: "inflict_status",
        status: "stun"
      }
    ]
  },
  %{
    name: "shield_block",
    initiative: 60,
    tooltip: "Set a blocking stance for one turn.",
    actions: [
      %{
        name: "gain_shield_block",
        modifier: 1.0,
        order: 1,
        range: 0,
        type: "gain_status",
        status: "blocking"
      }
    ]
  },
  %{
    name: "wounding_blow",
    initiative: 70,
    tooltip: "Attack an adjacent enemy for reduced damage, but also apply a slow.",
    actions: [
      %{
        name: "wounding_blow_attack",
        modifier: 0.5,
        order: 1,
        range: 1,
        type: "attack"
      },
      %{
        name: "wounding_blow_slow",
        modifier: 1.0,
        order: 2,
        range: 1,
        type: "inflict_status",
        status: "slow"
      }
    ]
  }
]

Enum.each(skill_data, fn(data) ->
  Game.create_skill(data)
end)

