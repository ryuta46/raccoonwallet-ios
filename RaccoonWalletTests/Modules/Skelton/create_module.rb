require 'erb'
require 'date'
require 'FileUtils'

date = Date.today().strftime("%Y/%m/%d")
module_name = ARGV[0]
module_name_camel = module_name[0].downcase() + module_name[1..-1]

DIRS = [
    "Interactor", "Presenter"
]

def get_target_files(module_name)
    return [
        [__dir__ + "/Interactor/SkeltonInteractorTest.swift.erb",  "Interactor/#{module_name}InteractorTest.swift"],
        [__dir__ + "/Presenter/SkeltonPresenterTest.swift.erb",  "Presenter/#{module_name}PresenterTest.swift"],
    ]
end

FileUtils.mkdir_p(module_name)
DIRS.each { |dir|
    FileUtils.mkdir_p("#{module_name}/#{dir}")
}

get_target_files(module_name).each { |target|
    erb = ERB.new(IO.read(target[0]))
    File.open("#{module_name}/#{target[1]}", "w") { |f|
        f.puts(erb.result(binding))
    }
}
