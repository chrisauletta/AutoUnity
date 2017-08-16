# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170816011800) do

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "oficio"
    t.string "rua"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "cep"
    t.string "telefone"
    t.string "celular"
    t.string "comercial"
    t.string "email"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estoques", force: :cascade do |t|
    t.integer "peca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "nome_fornecedor"
    t.string "ramo"
    t.string "vendedor"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orcamentos", force: :cascade do |t|
    t.string "status"
    t.integer "quilometragem"
    t.integer "valor_total"
    t.text "descricao"
    t.integer "cliente_id"
    t.integer "veiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_orcamentos_on_cliente_id"
    t.index ["veiculo_id"], name: "index_orcamentos_on_veiculo_id"
  end

  create_table "peca_orcs", force: :cascade do |t|
    t.integer "orcamento_id"
    t.integer "peca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade"
    t.integer "preco_o"
    t.index ["orcamento_id"], name: "index_peca_orcs_on_orcamento_id"
    t.index ["peca_id"], name: "index_peca_orcs_on_peca_id"
  end

  create_table "pecas", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.string "fabricante"
    t.decimal "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fornecedor_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.decimal "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "marca"
    t.string "modelo"
    t.string "ano"
    t.string "cor"
    t.integer "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_veiculos_on_cliente_id"
  end

end
