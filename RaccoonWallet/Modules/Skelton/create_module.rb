require 'erb'
require 'date'
require 'FileUtils'

str = '晴天'

date = Date.today().strftime("%Y/%m/%d")
module_name = ARGV[0]
module_name_camel = module_name[0].downcase() + module_name[1..-1]

DIRS = [
    "Contract", "Interactor", "Presenter", "Router", "View"
]

def get_target_files(module_name)
    return [
        [__dir__ + "/Contract/SkeltonContract.swift.erb",  "Contract/#{module_name}Contract.swift"],
        [__dir__ + "/Interactor/SkeltonInteractor.swift.erb",  "Interactor/#{module_name}Interactor.swift"],
        [__dir__ + "/Presenter/SkeltonPresenter.swift.erb",  "Presenter/#{module_name}Presenter.swift"],
        [__dir__ + "/Router/SkeltonRouter.swift.erb",  "Router/#{module_name}Router.swift"],
        [__dir__ + "/View/SkeltonViewController.swift.erb",  "View/#{module_name}ViewController.swift"],
        [__dir__ + "/View/SkeltonStoryboard.storyboard.erb",  "View/#{module_name}Storyboard.storyboard"],
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
