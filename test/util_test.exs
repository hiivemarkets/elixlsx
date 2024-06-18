use PropCheck

defmodule UtilTest do
  use ExUnit.Case, async: false

  alias Elixlsx.Util

  property "Util.encode_col reverses decode_col", [:verbose] do
    forall x <- non_neg_integer() do
      assert Util.decode_col(Util.encode_col(x)) == x
    end
  end

  test "width_to_px" do
    assert Util.width_to_px(1, %Image{}) == 12
    assert Util.width_to_px(1, %Image{char: 10}) == 15
  end
end
