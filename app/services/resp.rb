class Resp
  def self.not_found
    {file: 'public/404.html', status: :not_found, layout: false}
  end
  def sef.object_erros(object)
    {json: {errors: object_erros}, status: :bad_request}
  end
end
