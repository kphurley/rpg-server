defmodule RpgServer.GameTest do
  use RpgServer.DataCase

  alias RpgServer.Game

  describe "actions" do
    alias RpgServer.Game.Action

    @valid_attrs %{modifier: 120.5, name: "some name", order: 42, range: 42}
    @update_attrs %{modifier: 456.7, name: "some updated name", order: 43, range: 43}
    @invalid_attrs %{modifier: nil, name: nil, order: nil, range: nil}

    def action_fixture(attrs \\ %{}) do
      {:ok, action} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_action()

      action
    end

    test "list_actions/0 returns all actions" do
      action = action_fixture()
      assert Game.list_actions() == [action]
    end

    test "get_action!/1 returns the action with given id" do
      action = action_fixture()
      assert Game.get_action!(action.id) == action
    end

    test "create_action/1 with valid data creates a action" do
      assert {:ok, %Action{} = action} = Game.create_action(@valid_attrs)
      assert action.modifier == 120.5
      assert action.name == "some name"
      assert action.order == 42
      assert action.range == 42
    end

    test "create_action/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_action(@invalid_attrs)
    end

    test "update_action/2 with valid data updates the action" do
      action = action_fixture()
      assert {:ok, %Action{} = action} = Game.update_action(action, @update_attrs)
      assert action.modifier == 456.7
      assert action.name == "some updated name"
      assert action.order == 43
      assert action.range == 43
    end

    test "update_action/2 with invalid data returns error changeset" do
      action = action_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_action(action, @invalid_attrs)
      assert action == Game.get_action!(action.id)
    end

    test "delete_action/1 deletes the action" do
      action = action_fixture()
      assert {:ok, %Action{}} = Game.delete_action(action)
      assert_raise Ecto.NoResultsError, fn -> Game.get_action!(action.id) end
    end

    test "change_action/1 returns a action changeset" do
      action = action_fixture()
      assert %Ecto.Changeset{} = Game.change_action(action)
    end
  end

  describe "skills" do
    alias RpgServer.Game.Skill

    @valid_attrs %{expertise: 120.5, initiative: 42, name: "some name", tooltip: "some tooltip"}
    @update_attrs %{expertise: 456.7, initiative: 43, name: "some updated name", tooltip: "some updated tooltip"}
    @invalid_attrs %{expertise: nil, initiative: nil, name: nil, tooltip: nil}

    def skill_fixture(attrs \\ %{}) do
      {:ok, skill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_skill()

      skill
    end

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Game.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Game.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      assert {:ok, %Skill{} = skill} = Game.create_skill(@valid_attrs)
      assert skill.expertise == 120.5
      assert skill.initiative == 42
      assert skill.name == "some name"
      assert skill.tooltip == "some tooltip"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{} = skill} = Game.update_skill(skill, @update_attrs)
      assert skill.expertise == 456.7
      assert skill.initiative == 43
      assert skill.name == "some updated name"
      assert skill.tooltip == "some updated tooltip"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_skill(skill, @invalid_attrs)
      assert skill == Game.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Game.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Game.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Game.change_skill(skill)
    end
  end
end
