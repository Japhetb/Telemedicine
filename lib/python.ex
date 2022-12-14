defmodule Telemedicine.PythonHelper do

  def start_instance(path, version \\ 'python') do
    :python.start([{:python_path, path}, {:python, version}])
  end

  def call_instance(pid, module, function, args \\ []) do
    :python.call(pid, module, function, args)
  end

  def stop_instance(pid) do
    :python.stop(pid)
  end


  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

 end
