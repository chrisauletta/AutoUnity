require 'test_helper'

class NomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nome = nomes(:one)
  end

  test "should get index" do
    get nomes_url
    assert_response :success
  end

  test "should get new" do
    get new_nome_url
    assert_response :success
  end

  test "should create nome" do
    assert_difference('Nome.count') do
      post nomes_url, params: { nome: { descricao: @nome.descricao, preco: @nome.preco } }
    end

    assert_redirected_to nome_url(Nome.last)
  end

  test "should show nome" do
    get nome_url(@nome)
    assert_response :success
  end

  test "should get edit" do
    get edit_nome_url(@nome)
    assert_response :success
  end

  test "should update nome" do
    patch nome_url(@nome), params: { nome: { descricao: @nome.descricao, preco: @nome.preco } }
    assert_redirected_to nome_url(@nome)
  end

  test "should destroy nome" do
    assert_difference('Nome.count', -1) do
      delete nome_url(@nome)
    end

    assert_redirected_to nomes_url
  end
end
