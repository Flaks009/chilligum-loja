# frozen_string_literal: true

json.array! @produtos, partial: 'produtos/produto', as: :produto
