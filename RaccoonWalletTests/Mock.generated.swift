// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
import NemSwift
import RxSwift
import RxBlocking
@testable import RaccoonWallet

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import NemSwift
import RxSwift
import RxBlocking
@testable import RaccoonWallet

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif



// MARK: - AboutInteractorOutput
class AboutInteractorOutputMock: AboutInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - AboutPresentation
class AboutPresentationMock: AboutPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: AboutView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (AboutView)?
    var interactor: AboutUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("AboutPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (AboutUseCase)?
    var router: AboutWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("AboutPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (AboutWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<AboutView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<AboutUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<AboutWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickOfficialSite() {
        addInvocation(.ididClickOfficialSite)
		let perform = methodPerformValue(.ididClickOfficialSite) as? () -> Void
		perform?()
    }

    func didClickDiscord() {
        addInvocation(.ididClickDiscord)
		let perform = methodPerformValue(.ididClickDiscord) as? () -> Void
		perform?()
    }

    func didClickOpenSource() {
        addInvocation(.ididClickOpenSource)
		let perform = methodPerformValue(.ididClickOpenSource) as? () -> Void
		perform?()
    }

    func didClickReview() {
        addInvocation(.ididClickReview)
		let perform = methodPerformValue(.ididClickReview) as? () -> Void
		perform?()
    }

    func didClickPrivacyPolicy() {
        addInvocation(.ididClickPrivacyPolicy)
		let perform = methodPerformValue(.ididClickPrivacyPolicy) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickOfficialSite
        case ididClickDiscord
        case ididClickOpenSource
        case ididClickReview
        case ididClickPrivacyPolicy
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<AboutView?>)
        case interactor_get
		case interactor_set(Parameter<AboutUseCase?>)
        case router_get
		case router_set(Parameter<AboutWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickOfficialSite, .ididClickOfficialSite):
                    return true 
                case (.ididClickDiscord, .ididClickDiscord):
                    return true 
                case (.ididClickOpenSource, .ididClickOpenSource):
                    return true 
                case (.ididClickReview, .ididClickReview):
                    return true 
                case (.ididClickPrivacyPolicy, .ididClickPrivacyPolicy):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<AboutView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<AboutUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<AboutWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickOfficialSite: return 0
                case .ididClickDiscord: return 0
                case .ididClickOpenSource: return 0
                case .ididClickReview: return 0
                case .ididClickPrivacyPolicy: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickOfficialSite() -> Verify {
            return Verify(method: .ididClickOfficialSite)
        }
        static func didClickDiscord() -> Verify {
            return Verify(method: .ididClickDiscord)
        }
        static func didClickOpenSource() -> Verify {
            return Verify(method: .ididClickOpenSource)
        }
        static func didClickReview() -> Verify {
            return Verify(method: .ididClickReview)
        }
        static func didClickPrivacyPolicy() -> Verify {
            return Verify(method: .ididClickPrivacyPolicy)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickOfficialSite(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickOfficialSite, performs: perform)
        }
        static func didClickDiscord(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickDiscord, performs: perform)
        }
        static func didClickOpenSource(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickOpenSource, performs: perform)
        }
        static func didClickReview(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickReview, performs: perform)
        }
        static func didClickPrivacyPolicy(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickPrivacyPolicy, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - AboutUseCase
class AboutUseCaseMock: AboutUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: AboutInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("AboutUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (AboutInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<AboutInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<AboutInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<AboutInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - AboutView
class AboutViewMock: AboutView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: AboutPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("AboutViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (AboutPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<AboutPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showReviewInApp() {
        addInvocation(.ishowReviewInApp)
		let perform = methodPerformValue(.ishowReviewInApp) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowReviewInApp
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<AboutPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowReviewInApp, .ishowReviewInApp):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<AboutPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowReviewInApp: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showReviewInApp() -> Verify {
            return Verify(method: .ishowReviewInApp)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showReviewInApp(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowReviewInApp, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - AboutWireframe
class AboutWireframeMock: AboutWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentOfficialSite() {
        addInvocation(.ipresentOfficialSite)
		let perform = methodPerformValue(.ipresentOfficialSite) as? () -> Void
		perform?()
    }

    func presentDiscord() {
        addInvocation(.ipresentDiscord)
		let perform = methodPerformValue(.ipresentDiscord) as? () -> Void
		perform?()
    }

    func presentOpenSource() {
        addInvocation(.ipresentOpenSource)
		let perform = methodPerformValue(.ipresentOpenSource) as? () -> Void
		perform?()
    }

    func presentReview() {
        addInvocation(.ipresentReview)
		let perform = methodPerformValue(.ipresentReview) as? () -> Void
		perform?()
    }

    func presentPrivacyPolicy() {
        addInvocation(.ipresentPrivacyPolicy)
		let perform = methodPerformValue(.ipresentPrivacyPolicy) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentOfficialSite
        case ipresentDiscord
        case ipresentOpenSource
        case ipresentReview
        case ipresentPrivacyPolicy
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentOfficialSite, .ipresentOfficialSite):
                    return true 
                case (.ipresentDiscord, .ipresentDiscord):
                    return true 
                case (.ipresentOpenSource, .ipresentOpenSource):
                    return true 
                case (.ipresentReview, .ipresentReview):
                    return true 
                case (.ipresentPrivacyPolicy, .ipresentPrivacyPolicy):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ipresentOfficialSite: return 0
                case .ipresentDiscord: return 0
                case .ipresentOpenSource: return 0
                case .ipresentReview: return 0
                case .ipresentPrivacyPolicy: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentOfficialSite() -> Verify {
            return Verify(method: .ipresentOfficialSite)
        }
        static func presentDiscord() -> Verify {
            return Verify(method: .ipresentDiscord)
        }
        static func presentOpenSource() -> Verify {
            return Verify(method: .ipresentOpenSource)
        }
        static func presentReview() -> Verify {
            return Verify(method: .ipresentReview)
        }
        static func presentPrivacyPolicy() -> Verify {
            return Verify(method: .ipresentPrivacyPolicy)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentOfficialSite(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentOfficialSite, performs: perform)
        }
        static func presentDiscord(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentDiscord, performs: perform)
        }
        static func presentOpenSource(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentOpenSource, performs: perform)
        }
        static func presentReview(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentReview, performs: perform)
        }
        static func presentPrivacyPolicy(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentPrivacyPolicy, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BalanceDetailInteractorOutput
class BalanceDetailInteractorOutputMock: BalanceDetailInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        addInvocation(.imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>.value(mosaics)))
		let perform = methodPerformValue(.imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>.value(mosaics))) as? ([MosaicDetail]) -> Void
		perform?(mosaics)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        addInvocation(.imosaicOwnedFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.imosaicOwnedFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>)
        case imosaicOwnedFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.imosaicOwnedFetched__mosaics(let lhsMosaics), .imosaicOwnedFetched__mosaics(let rhsMosaics)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    return true 
                case (.imosaicOwnedFetchFailed__error(let lhsError), .imosaicOwnedFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .imosaicOwnedFetched__mosaics(p0): return p0.intValue
                case let .imosaicOwnedFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func mosaicOwnedFetched(mosaics: Parameter<[MosaicDetail]>) -> Verify {
            return Verify(method: .imosaicOwnedFetched__mosaics(mosaics))
        }
        static func mosaicOwnedFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .imosaicOwnedFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func mosaicOwnedFetched(mosaics: Parameter<[MosaicDetail]>, perform: @escaping ([MosaicDetail]) -> Void) -> Perform {
            return Perform(method: .imosaicOwnedFetched__mosaics(mosaics), performs: perform)
        }
        static func mosaicOwnedFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .imosaicOwnedFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BalanceDetailPresentation
class BalanceDetailPresentationMock: BalanceDetailPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: BalanceDetailView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (BalanceDetailView)?
    var interactor: BalanceDetailUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("BalanceDetailPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (BalanceDetailUseCase)?
    var router: BalanceDetailWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("BalanceDetailPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (BalanceDetailWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<BalanceDetailView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<BalanceDetailUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<BalanceDetailWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<BalanceDetailView?>)
        case interactor_get
		case interactor_set(Parameter<BalanceDetailUseCase?>)
        case router_get
		case router_set(Parameter<BalanceDetailWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<BalanceDetailView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<BalanceDetailUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<BalanceDetailWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BalanceDetailUseCase
class BalanceDetailUseCaseMock: BalanceDetailUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: BalanceDetailInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("BalanceDetailUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (BalanceDetailInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<BalanceDetailInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchMosaicOwned(_ address: String) {
        addInvocation(.ifetchMosaicOwned__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ifetchMosaicOwned__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    fileprivate enum MethodType {
        case ifetchMosaicOwned__address(Parameter<String>)
        case output_get
		case output_set(Parameter<BalanceDetailInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchMosaicOwned__address(let lhsAddress), .ifetchMosaicOwned__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<BalanceDetailInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ifetchMosaicOwned__address(p0): return p0.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchMosaicOwned(address: Parameter<String>) -> Verify {
            return Verify(method: .ifetchMosaicOwned__address(address))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchMosaicOwned(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ifetchMosaicOwned__address(address), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BalanceDetailView
class BalanceDetailViewMock: BalanceDetailView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: BalanceDetailPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("BalanceDetailViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (BalanceDetailPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<BalanceDetailPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showBalanceLoading() {
        addInvocation(.ishowBalanceLoading)
		let perform = methodPerformValue(.ishowBalanceLoading) as? () -> Void
		perform?()
    }

    func showBalance(_ xem: String) {
        addInvocation(.ishowBalance__xem(Parameter<String>.value(xem)))
		let perform = methodPerformValue(.ishowBalance__xem(Parameter<String>.value(xem))) as? (String) -> Void
		perform?(xem)
    }

    func showMosaicListLoading() {
        addInvocation(.ishowMosaicListLoading)
		let perform = methodPerformValue(.ishowMosaicListLoading) as? () -> Void
		perform?()
    }

    func showMosaics(_ mosaics: [MosaicDetail]) {
        addInvocation(.ishowMosaics__mosaics(Parameter<[MosaicDetail]>.value(mosaics)))
		let perform = methodPerformValue(.ishowMosaics__mosaics(Parameter<[MosaicDetail]>.value(mosaics))) as? ([MosaicDetail]) -> Void
		perform?(mosaics)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowBalanceLoading
        case ishowBalance__xem(Parameter<String>)
        case ishowMosaicListLoading
        case ishowMosaics__mosaics(Parameter<[MosaicDetail]>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<BalanceDetailPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowBalanceLoading, .ishowBalanceLoading):
                    return true 
                case (.ishowBalance__xem(let lhsXem), .ishowBalance__xem(let rhsXem)):
                    guard Parameter.compare(lhs: lhsXem, rhs: rhsXem, with: matcher) else { return false } 
                    return true 
                case (.ishowMosaicListLoading, .ishowMosaicListLoading):
                    return true 
                case (.ishowMosaics__mosaics(let lhsMosaics), .ishowMosaics__mosaics(let rhsMosaics)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<BalanceDetailPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowBalanceLoading: return 0
                case let .ishowBalance__xem(p0): return p0.intValue
                case .ishowMosaicListLoading: return 0
                case let .ishowMosaics__mosaics(p0): return p0.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showBalanceLoading() -> Verify {
            return Verify(method: .ishowBalanceLoading)
        }
        static func showBalance(xem: Parameter<String>) -> Verify {
            return Verify(method: .ishowBalance__xem(xem))
        }
        static func showMosaicListLoading() -> Verify {
            return Verify(method: .ishowMosaicListLoading)
        }
        static func showMosaics(mosaics: Parameter<[MosaicDetail]>) -> Verify {
            return Verify(method: .ishowMosaics__mosaics(mosaics))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showBalanceLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowBalanceLoading, performs: perform)
        }
        static func showBalance(xem: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowBalance__xem(xem), performs: perform)
        }
        static func showMosaicListLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowMosaicListLoading, performs: perform)
        }
        static func showMosaics(mosaics: Parameter<[MosaicDetail]>, perform: @escaping ([MosaicDetail]) -> Void) -> Perform {
            return Perform(method: .ishowMosaics__mosaics(mosaics), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BalanceDetailWireframe
class BalanceDetailWireframeMock: BalanceDetailWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BaseInteractorOutput
class BaseInteractorOutputMock: BaseInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BasePresentation
class BasePresentationMock: BasePresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BaseUseCase
class BaseUseCaseMock: BaseUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BaseView
class BaseViewMock: BaseView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - BaseWireframe
class BaseWireframeMock: BaseWireframe, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationDetailInteractorOutput
class DonationDetailInteractorOutputMock: DonationDetailInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationDetailPresentation
class DonationDetailPresentationMock: DonationDetailPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: DonationDetailView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (DonationDetailView)?
    var interactor: DonationDetailUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("DonationDetailPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (DonationDetailUseCase)?
    var router: DonationDetailWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("DonationDetailPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (DonationDetailWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<DonationDetailView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<DonationDetailUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<DonationDetailWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickDonate() {
        addInvocation(.ididClickDonate)
		let perform = methodPerformValue(.ididClickDonate) as? () -> Void
		perform?()
    }

    func didClickGoPinSetting() {
        addInvocation(.ididClickGoPinSetting)
		let perform = methodPerformValue(.ididClickGoPinSetting) as? () -> Void
		perform?()
    }

    func didClickGoWalletSelect() {
        addInvocation(.ididClickGoWalletSelect)
		let perform = methodPerformValue(.ididClickGoWalletSelect) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickDonate
        case ididClickGoPinSetting
        case ididClickGoWalletSelect
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<DonationDetailView?>)
        case interactor_get
		case interactor_set(Parameter<DonationDetailUseCase?>)
        case router_get
		case router_set(Parameter<DonationDetailWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickDonate, .ididClickDonate):
                    return true 
                case (.ididClickGoPinSetting, .ididClickGoPinSetting):
                    return true 
                case (.ididClickGoWalletSelect, .ididClickGoWalletSelect):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<DonationDetailView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<DonationDetailUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<DonationDetailWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickDonate: return 0
                case .ididClickGoPinSetting: return 0
                case .ididClickGoWalletSelect: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickDonate() -> Verify {
            return Verify(method: .ididClickDonate)
        }
        static func didClickGoPinSetting() -> Verify {
            return Verify(method: .ididClickGoPinSetting)
        }
        static func didClickGoWalletSelect() -> Verify {
            return Verify(method: .ididClickGoWalletSelect)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickDonate(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickDonate, performs: perform)
        }
        static func didClickGoPinSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGoPinSetting, performs: perform)
        }
        static func didClickGoWalletSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGoWalletSelect, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationDetailUseCase
class DonationDetailUseCaseMock: DonationDetailUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: DonationDetailInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("DonationDetailUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (DonationDetailInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<DonationDetailInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<DonationDetailInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<DonationDetailInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationDetailView
class DonationDetailViewMock: DonationDetailView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: DonationDetailPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("DonationDetailViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (DonationDetailPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<DonationDetailPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showDeveloper(_ developer: Developer) {
        addInvocation(.ishowDeveloper__developer(Parameter<Developer>.value(developer)))
		let perform = methodPerformValue(.ishowDeveloper__developer(Parameter<Developer>.value(developer))) as? (Developer) -> Void
		perform?(developer)
    }

    func showNotSetPinError() {
        addInvocation(.ishowNotSetPinError)
		let perform = methodPerformValue(.ishowNotSetPinError) as? () -> Void
		perform?()
    }

    func showNotSelectWalletError() {
        addInvocation(.ishowNotSelectWalletError)
		let perform = methodPerformValue(.ishowNotSelectWalletError) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowDeveloper__developer(Parameter<Developer>)
        case ishowNotSetPinError
        case ishowNotSelectWalletError
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<DonationDetailPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowDeveloper__developer(let lhsDeveloper), .ishowDeveloper__developer(let rhsDeveloper)):
                    guard Parameter.compare(lhs: lhsDeveloper, rhs: rhsDeveloper, with: matcher) else { return false } 
                    return true 
                case (.ishowNotSetPinError, .ishowNotSetPinError):
                    return true 
                case (.ishowNotSelectWalletError, .ishowNotSelectWalletError):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<DonationDetailPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowDeveloper__developer(p0): return p0.intValue
                case .ishowNotSetPinError: return 0
                case .ishowNotSelectWalletError: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showDeveloper(developer: Parameter<Developer>) -> Verify {
            return Verify(method: .ishowDeveloper__developer(developer))
        }
        static func showNotSetPinError() -> Verify {
            return Verify(method: .ishowNotSetPinError)
        }
        static func showNotSelectWalletError() -> Verify {
            return Verify(method: .ishowNotSelectWalletError)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showDeveloper(developer: Parameter<Developer>, perform: @escaping (Developer) -> Void) -> Perform {
            return Perform(method: .ishowDeveloper__developer(developer), performs: perform)
        }
        static func showNotSetPinError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowNotSetPinError, performs: perform)
        }
        static func showNotSelectWalletError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowNotSelectWalletError, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationDetailWireframe
class DonationDetailWireframeMock: DonationDetailWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ developer: Developer) -> UIViewController {
        addInvocation(.sassembleModule__developer(Parameter<Developer>.value(developer)))
		let perform = methodPerformValue(.sassembleModule__developer(Parameter<Developer>.value(developer))) as? (Developer) -> Void
		perform?(developer)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__developer(Parameter<Developer>.value(developer)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ developer: Developer). Use given")
    }

    func presentSendAmount(sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendAmount__sendTransaction_sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendAmount__sendTransaction_sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    func presentSetting() {
        addInvocation(.ipresentSetting)
		let perform = methodPerformValue(.ipresentSetting) as? () -> Void
		perform?()
    }

    func presentWalletSelect() {
        addInvocation(.ipresentWalletSelect)
		let perform = methodPerformValue(.ipresentWalletSelect) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__developer(Parameter<Developer>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__developer(let lhsDeveloper), .sassembleModule__developer(let rhsDeveloper)):
                    guard Parameter.compare(lhs: lhsDeveloper, rhs: rhsDeveloper, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__developer(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(developer: Parameter<Developer>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__developer(developer), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(developer: Parameter<Developer>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__developer(developer))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(developer: Parameter<Developer>, perform: @escaping (Developer) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__developer(developer), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentSendAmount__sendTransaction_sendTransaction(Parameter<SendTransaction>)
        case ipresentSetting
        case ipresentWalletSelect
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentSendAmount__sendTransaction_sendTransaction(let lhsSendtransaction), .ipresentSendAmount__sendTransaction_sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.ipresentSetting, .ipresentSetting):
                    return true 
                case (.ipresentWalletSelect, .ipresentWalletSelect):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentSendAmount__sendTransaction_sendTransaction(p0): return p0.intValue
                case .ipresentSetting: return 0
                case .ipresentWalletSelect: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentSendAmount(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendAmount__sendTransaction_sendTransaction(sendTransaction))
        }
        static func presentSetting() -> Verify {
            return Verify(method: .ipresentSetting)
        }
        static func presentWalletSelect() -> Verify {
            return Verify(method: .ipresentWalletSelect)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentSendAmount(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendAmount__sendTransaction_sendTransaction(sendTransaction), performs: perform)
        }
        static func presentSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentSetting, performs: perform)
        }
        static func presentWalletSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentWalletSelect, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationTopInteractorOutput
class DonationTopInteractorOutputMock: DonationTopInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationTopPresentation
class DonationTopPresentationMock: DonationTopPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: DonationTopView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (DonationTopView)?
    var interactor: DonationTopUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("DonationTopPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (DonationTopUseCase)?
    var router: DonationTopWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("DonationTopPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (DonationTopWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<DonationTopView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<DonationTopUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<DonationTopWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickDeveloper(_ developer: Developer) {
        addInvocation(.ididClickDeveloper__developer(Parameter<Developer>.value(developer)))
		let perform = methodPerformValue(.ididClickDeveloper__developer(Parameter<Developer>.value(developer))) as? (Developer) -> Void
		perform?(developer)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickDeveloper__developer(Parameter<Developer>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<DonationTopView?>)
        case interactor_get
		case interactor_set(Parameter<DonationTopUseCase?>)
        case router_get
		case router_set(Parameter<DonationTopWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickDeveloper__developer(let lhsDeveloper), .ididClickDeveloper__developer(let rhsDeveloper)):
                    guard Parameter.compare(lhs: lhsDeveloper, rhs: rhsDeveloper, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<DonationTopView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<DonationTopUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<DonationTopWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ididClickDeveloper__developer(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickDeveloper(developer: Parameter<Developer>) -> Verify {
            return Verify(method: .ididClickDeveloper__developer(developer))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickDeveloper(developer: Parameter<Developer>, perform: @escaping (Developer) -> Void) -> Perform {
            return Perform(method: .ididClickDeveloper__developer(developer), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationTopUseCase
class DonationTopUseCaseMock: DonationTopUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: DonationTopInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("DonationTopUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (DonationTopInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<DonationTopInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<DonationTopInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<DonationTopInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationTopView
class DonationTopViewMock: DonationTopView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: DonationTopPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("DonationTopViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (DonationTopPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<DonationTopPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<DonationTopPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<DonationTopPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - DonationTopWireframe
class DonationTopWireframeMock: DonationTopWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentDonationDetail(_ developer: Developer) {
        addInvocation(.ipresentDonationDetail__developer(Parameter<Developer>.value(developer)))
		let perform = methodPerformValue(.ipresentDonationDetail__developer(Parameter<Developer>.value(developer))) as? (Developer) -> Void
		perform?(developer)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentDonationDetail__developer(Parameter<Developer>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentDonationDetail__developer(let lhsDeveloper), .ipresentDonationDetail__developer(let rhsDeveloper)):
                    guard Parameter.compare(lhs: lhsDeveloper, rhs: rhsDeveloper, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentDonationDetail__developer(p0): return p0.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentDonationDetail(developer: Parameter<Developer>) -> Verify {
            return Verify(method: .ipresentDonationDetail__developer(developer))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentDonationDetail(developer: Parameter<Developer>, perform: @escaping (Developer) -> Void) -> Perform {
            return Perform(method: .ipresentDonationDetail__developer(developer), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionConceptInteractorOutput
class IntroductionConceptInteractorOutputMock: IntroductionConceptInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionConceptPresentation
class IntroductionConceptPresentationMock: IntroductionConceptPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: IntroductionConceptView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (IntroductionConceptView)?
    var interactor: IntroductionConceptUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("IntroductionConceptPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (IntroductionConceptUseCase)?
    var router: IntroductionConceptWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("IntroductionConceptPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (IntroductionConceptWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<IntroductionConceptView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<IntroductionConceptUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<IntroductionConceptWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didChangePage(_ page: Int) {
        addInvocation(.ididChangePage__page(Parameter<Int>.value(page)))
		let perform = methodPerformValue(.ididChangePage__page(Parameter<Int>.value(page))) as? (Int) -> Void
		perform?(page)
    }

    func didClickGetStarted() {
        addInvocation(.ididClickGetStarted)
		let perform = methodPerformValue(.ididClickGetStarted) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididChangePage__page(Parameter<Int>)
        case ididClickGetStarted
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<IntroductionConceptView?>)
        case interactor_get
		case interactor_set(Parameter<IntroductionConceptUseCase?>)
        case router_get
		case router_set(Parameter<IntroductionConceptWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididChangePage__page(let lhsPage), .ididChangePage__page(let rhsPage)):
                    guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                    return true 
                case (.ididClickGetStarted, .ididClickGetStarted):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<IntroductionConceptView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<IntroductionConceptUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<IntroductionConceptWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ididChangePage__page(p0): return p0.intValue
                case .ididClickGetStarted: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didChangePage(page: Parameter<Int>) -> Verify {
            return Verify(method: .ididChangePage__page(page))
        }
        static func didClickGetStarted() -> Verify {
            return Verify(method: .ididClickGetStarted)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didChangePage(page: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .ididChangePage__page(page), performs: perform)
        }
        static func didClickGetStarted(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGetStarted, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionConceptUseCase
class IntroductionConceptUseCaseMock: IntroductionConceptUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: IntroductionConceptInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("IntroductionConceptUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (IntroductionConceptInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<IntroductionConceptInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<IntroductionConceptInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<IntroductionConceptInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionConceptView
class IntroductionConceptViewMock: IntroductionConceptView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: IntroductionConceptPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("IntroductionConceptViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (IntroductionConceptPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<IntroductionConceptPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showMessage(_ message: String) {
        addInvocation(.ishowMessage__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowMessage__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showGetStarted() {
        addInvocation(.ishowGetStarted)
		let perform = methodPerformValue(.ishowGetStarted) as? () -> Void
		perform?()
    }

    func hideGetStarted() {
        addInvocation(.ihideGetStarted)
		let perform = methodPerformValue(.ihideGetStarted) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowMessage__message(Parameter<String>)
        case ishowGetStarted
        case ihideGetStarted
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<IntroductionConceptPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowMessage__message(let lhsMessage), .ishowMessage__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowGetStarted, .ishowGetStarted):
                    return true 
                case (.ihideGetStarted, .ihideGetStarted):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<IntroductionConceptPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowMessage__message(p0): return p0.intValue
                case .ishowGetStarted: return 0
                case .ihideGetStarted: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showMessage(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowMessage__message(message))
        }
        static func showGetStarted() -> Verify {
            return Verify(method: .ishowGetStarted)
        }
        static func hideGetStarted() -> Verify {
            return Verify(method: .ihideGetStarted)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showMessage(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowMessage__message(message), performs: perform)
        }
        static func showGetStarted(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowGetStarted, performs: perform)
        }
        static func hideGetStarted(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideGetStarted, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionConceptWireframe
class IntroductionConceptWireframeMock: IntroductionConceptWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentIntroductionMessage() {
        addInvocation(.ipresentIntroductionMessage)
		let perform = methodPerformValue(.ipresentIntroductionMessage) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentIntroductionMessage
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentIntroductionMessage, .ipresentIntroductionMessage):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ipresentIntroductionMessage: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentIntroductionMessage() -> Verify {
            return Verify(method: .ipresentIntroductionMessage)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentIntroductionMessage(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentIntroductionMessage, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionMessageInteractorOutput
class IntroductionMessageInteractorOutputMock: IntroductionMessageInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionMessagePresentation
class IntroductionMessagePresentationMock: IntroductionMessagePresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: IntroductionMessageView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (IntroductionMessageView)?
    var interactor: IntroductionMessageUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("IntroductionMessagePresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (IntroductionMessageUseCase)?
    var router: IntroductionMessageWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("IntroductionMessagePresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (IntroductionMessageWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<IntroductionMessageView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<IntroductionMessageUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<IntroductionMessageWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickOk() {
        addInvocation(.ididClickOk)
		let perform = methodPerformValue(.ididClickOk) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickOk
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<IntroductionMessageView?>)
        case interactor_get
		case interactor_set(Parameter<IntroductionMessageUseCase?>)
        case router_get
		case router_set(Parameter<IntroductionMessageWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickOk, .ididClickOk):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<IntroductionMessageView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<IntroductionMessageUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<IntroductionMessageWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickOk: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickOk() -> Verify {
            return Verify(method: .ididClickOk)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickOk(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickOk, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionMessageUseCase
class IntroductionMessageUseCaseMock: IntroductionMessageUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: IntroductionMessageInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("IntroductionMessageUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (IntroductionMessageInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<IntroductionMessageInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<IntroductionMessageInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<IntroductionMessageInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionMessageView
class IntroductionMessageViewMock: IntroductionMessageView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: IntroductionMessagePresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("IntroductionMessageViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (IntroductionMessagePresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<IntroductionMessagePresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<IntroductionMessagePresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<IntroductionMessagePresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - IntroductionMessageWireframe
class IntroductionMessageWireframeMock: IntroductionMessageWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentCreateWallet() {
        addInvocation(.ipresentCreateWallet)
		let perform = methodPerformValue(.ipresentCreateWallet) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentCreateWallet
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentCreateWallet, .ipresentCreateWallet):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ipresentCreateWallet: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentCreateWallet() -> Verify {
            return Verify(method: .ipresentCreateWallet)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentCreateWallet(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentCreateWallet, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicDetailInteractorOutput
class MosaicDetailInteractorOutputMock: MosaicDetailInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicDetailPresentation
class MosaicDetailPresentationMock: MosaicDetailPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: MosaicDetailView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (MosaicDetailView)?
    var interactor: MosaicDetailUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("MosaicDetailPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (MosaicDetailUseCase)?
    var router: MosaicDetailWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("MosaicDetailPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (MosaicDetailWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<MosaicDetailView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<MosaicDetailUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<MosaicDetailWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickOutside() {
        addInvocation(.ididClickOutside)
		let perform = methodPerformValue(.ididClickOutside) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickOutside
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<MosaicDetailView?>)
        case interactor_get
		case interactor_set(Parameter<MosaicDetailUseCase?>)
        case router_get
		case router_set(Parameter<MosaicDetailWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickOutside, .ididClickOutside):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<MosaicDetailView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<MosaicDetailUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<MosaicDetailWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickOutside: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickOutside() -> Verify {
            return Verify(method: .ididClickOutside)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickOutside(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickOutside, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicDetailUseCase
class MosaicDetailUseCaseMock: MosaicDetailUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: MosaicDetailInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("MosaicDetailUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (MosaicDetailInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<MosaicDetailInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<MosaicDetailInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<MosaicDetailInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicDetailView
class MosaicDetailViewMock: MosaicDetailView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: MosaicDetailPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("MosaicDetailViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (MosaicDetailPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<MosaicDetailPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showImage(_ url: URL) {
        addInvocation(.ishowImage__url(Parameter<URL>.value(url)))
		let perform = methodPerformValue(.ishowImage__url(Parameter<URL>.value(url))) as? (URL) -> Void
		perform?(url)
    }

    func showText(_ namespace: String, _ name: String) {
        addInvocation(.ishowText__namespace_name(Parameter<String>.value(namespace), Parameter<String>.value(name)))
		let perform = methodPerformValue(.ishowText__namespace_name(Parameter<String>.value(namespace), Parameter<String>.value(name))) as? (String, String) -> Void
		perform?(namespace, name)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowImage__url(Parameter<URL>)
        case ishowText__namespace_name(Parameter<String>, Parameter<String>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<MosaicDetailPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowImage__url(let lhsUrl), .ishowImage__url(let rhsUrl)):
                    guard Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher) else { return false } 
                    return true 
                case (.ishowText__namespace_name(let lhsNamespace, let lhsName), .ishowText__namespace_name(let rhsNamespace, let rhsName)):
                    guard Parameter.compare(lhs: lhsNamespace, rhs: rhsNamespace, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<MosaicDetailPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowImage__url(p0): return p0.intValue
                case let .ishowText__namespace_name(p0, p1): return p0.intValue + p1.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showImage(url: Parameter<URL>) -> Verify {
            return Verify(method: .ishowImage__url(url))
        }
        static func showText(namespace: Parameter<String>, name: Parameter<String>) -> Verify {
            return Verify(method: .ishowText__namespace_name(namespace, name))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showImage(url: Parameter<URL>, perform: @escaping (URL) -> Void) -> Perform {
            return Perform(method: .ishowImage__url(url), performs: perform)
        }
        static func showText(namespace: Parameter<String>, name: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .ishowText__namespace_name(namespace, name), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicDetailWireframe
class MosaicDetailWireframeMock: MosaicDetailWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ mosaic: MosaicImageUrl) -> UIViewController {
        addInvocation(.sassembleModule__mosaic(Parameter<MosaicImageUrl>.value(mosaic)))
		let perform = methodPerformValue(.sassembleModule__mosaic(Parameter<MosaicImageUrl>.value(mosaic))) as? (MosaicImageUrl) -> Void
		perform?(mosaic)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__mosaic(Parameter<MosaicImageUrl>.value(mosaic)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ mosaic: MosaicImageUrl). Use given")
    }

    func dismiss() {
        addInvocation(.idismiss)
		let perform = methodPerformValue(.idismiss) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__mosaic(Parameter<MosaicImageUrl>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__mosaic(let lhsMosaic), .sassembleModule__mosaic(let rhsMosaic)):
                    guard Parameter.compare(lhs: lhsMosaic, rhs: rhsMosaic, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__mosaic(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(mosaic: Parameter<MosaicImageUrl>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__mosaic(mosaic), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(mosaic: Parameter<MosaicImageUrl>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__mosaic(mosaic))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(mosaic: Parameter<MosaicImageUrl>, perform: @escaping (MosaicImageUrl) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__mosaic(mosaic), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case idismiss
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.idismiss, .idismiss):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .idismiss: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func dismiss() -> Verify {
            return Verify(method: .idismiss)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func dismiss(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .idismiss, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicListInteractorOutput
class MosaicListInteractorOutputMock: MosaicListInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func mosaicListFetched(_ mosaics: [MosaicImageUrl]) {
        addInvocation(.imosaicListFetched__mosaics(Parameter<[MosaicImageUrl]>.value(mosaics)))
		let perform = methodPerformValue(.imosaicListFetched__mosaics(Parameter<[MosaicImageUrl]>.value(mosaics))) as? ([MosaicImageUrl]) -> Void
		perform?(mosaics)
    }

    func mosaicListFetchFailed(_ error: Error) {
        addInvocation(.imosaicListFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.imosaicListFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        addInvocation(.imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>.value(mosaics)))
		let perform = methodPerformValue(.imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>.value(mosaics))) as? ([MosaicDetail]) -> Void
		perform?(mosaics)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        addInvocation(.imosaicOwnedFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.imosaicOwnedFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case imosaicListFetched__mosaics(Parameter<[MosaicImageUrl]>)
        case imosaicListFetchFailed__error(Parameter<Error>)
        case imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>)
        case imosaicOwnedFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.imosaicListFetched__mosaics(let lhsMosaics), .imosaicListFetched__mosaics(let rhsMosaics)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    return true 
                case (.imosaicListFetchFailed__error(let lhsError), .imosaicListFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                case (.imosaicOwnedFetched__mosaics(let lhsMosaics), .imosaicOwnedFetched__mosaics(let rhsMosaics)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    return true 
                case (.imosaicOwnedFetchFailed__error(let lhsError), .imosaicOwnedFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .imosaicListFetched__mosaics(p0): return p0.intValue
                case let .imosaicListFetchFailed__error(p0): return p0.intValue
                case let .imosaicOwnedFetched__mosaics(p0): return p0.intValue
                case let .imosaicOwnedFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func mosaicListFetched(mosaics: Parameter<[MosaicImageUrl]>) -> Verify {
            return Verify(method: .imosaicListFetched__mosaics(mosaics))
        }
        static func mosaicListFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .imosaicListFetchFailed__error(error))
        }
        static func mosaicOwnedFetched(mosaics: Parameter<[MosaicDetail]>) -> Verify {
            return Verify(method: .imosaicOwnedFetched__mosaics(mosaics))
        }
        static func mosaicOwnedFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .imosaicOwnedFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func mosaicListFetched(mosaics: Parameter<[MosaicImageUrl]>, perform: @escaping ([MosaicImageUrl]) -> Void) -> Perform {
            return Perform(method: .imosaicListFetched__mosaics(mosaics), performs: perform)
        }
        static func mosaicListFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .imosaicListFetchFailed__error(error), performs: perform)
        }
        static func mosaicOwnedFetched(mosaics: Parameter<[MosaicDetail]>, perform: @escaping ([MosaicDetail]) -> Void) -> Perform {
            return Perform(method: .imosaicOwnedFetched__mosaics(mosaics), performs: perform)
        }
        static func mosaicOwnedFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .imosaicOwnedFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicListPresentation
class MosaicListPresentationMock: MosaicListPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: MosaicListView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (MosaicListView)?
    var interactor: MosaicListUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("MosaicListPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (MosaicListUseCase)?
    var router: MosaicListWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("MosaicListPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (MosaicListWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<MosaicListView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<MosaicListUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<MosaicListWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickMosaic(_ mosaic: MosaicImageUrl) {
        addInvocation(.ididClickMosaic__mosaic(Parameter<MosaicImageUrl>.value(mosaic)))
		let perform = methodPerformValue(.ididClickMosaic__mosaic(Parameter<MosaicImageUrl>.value(mosaic))) as? (MosaicImageUrl) -> Void
		perform?(mosaic)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickMosaic__mosaic(Parameter<MosaicImageUrl>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<MosaicListView?>)
        case interactor_get
		case interactor_set(Parameter<MosaicListUseCase?>)
        case router_get
		case router_set(Parameter<MosaicListWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickMosaic__mosaic(let lhsMosaic), .ididClickMosaic__mosaic(let rhsMosaic)):
                    guard Parameter.compare(lhs: lhsMosaic, rhs: rhsMosaic, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<MosaicListView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<MosaicListUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<MosaicListWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ididClickMosaic__mosaic(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickMosaic(mosaic: Parameter<MosaicImageUrl>) -> Verify {
            return Verify(method: .ididClickMosaic__mosaic(mosaic))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickMosaic(mosaic: Parameter<MosaicImageUrl>, perform: @escaping (MosaicImageUrl) -> Void) -> Perform {
            return Perform(method: .ididClickMosaic__mosaic(mosaic), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicListUseCase
class MosaicListUseCaseMock: MosaicListUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: MosaicListInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("MosaicListUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (MosaicListInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<MosaicListInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchMosaicOwned(_ address: String) {
        addInvocation(.ifetchMosaicOwned__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ifetchMosaicOwned__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    func fetchXEMBookMosaicList() {
        addInvocation(.ifetchXEMBookMosaicList)
		let perform = methodPerformValue(.ifetchXEMBookMosaicList) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ifetchMosaicOwned__address(Parameter<String>)
        case ifetchXEMBookMosaicList
        case output_get
		case output_set(Parameter<MosaicListInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchMosaicOwned__address(let lhsAddress), .ifetchMosaicOwned__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.ifetchXEMBookMosaicList, .ifetchXEMBookMosaicList):
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<MosaicListInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ifetchMosaicOwned__address(p0): return p0.intValue
                case .ifetchXEMBookMosaicList: return 0
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchMosaicOwned(address: Parameter<String>) -> Verify {
            return Verify(method: .ifetchMosaicOwned__address(address))
        }
        static func fetchXEMBookMosaicList() -> Verify {
            return Verify(method: .ifetchXEMBookMosaicList)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchMosaicOwned(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ifetchMosaicOwned__address(address), performs: perform)
        }
        static func fetchXEMBookMosaicList(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ifetchXEMBookMosaicList, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicListView
class MosaicListViewMock: MosaicListView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: MosaicListPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("MosaicListViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (MosaicListPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<MosaicListPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showLoading() {
        addInvocation(.ishowLoading)
		let perform = methodPerformValue(.ishowLoading) as? () -> Void
		perform?()
    }

    func hideLoading() {
        addInvocation(.ihideLoading)
		let perform = methodPerformValue(.ihideLoading) as? () -> Void
		perform?()
    }

    func showEmpty() {
        addInvocation(.ishowEmpty)
		let perform = methodPerformValue(.ishowEmpty) as? () -> Void
		perform?()
    }

    func showMosaics(_ mosaics: [MosaicImageUrl]) {
        addInvocation(.ishowMosaics__mosaics(Parameter<[MosaicImageUrl]>.value(mosaics)))
		let perform = methodPerformValue(.ishowMosaics__mosaics(Parameter<[MosaicImageUrl]>.value(mosaics))) as? ([MosaicImageUrl]) -> Void
		perform?(mosaics)
    }

    func showMosaicDetail(_ mosaic: MosaicImageUrl) {
        addInvocation(.ishowMosaicDetail__mosaic(Parameter<MosaicImageUrl>.value(mosaic)))
		let perform = methodPerformValue(.ishowMosaicDetail__mosaic(Parameter<MosaicImageUrl>.value(mosaic))) as? (MosaicImageUrl) -> Void
		perform?(mosaic)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowLoading
        case ihideLoading
        case ishowEmpty
        case ishowMosaics__mosaics(Parameter<[MosaicImageUrl]>)
        case ishowMosaicDetail__mosaic(Parameter<MosaicImageUrl>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<MosaicListPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowLoading, .ishowLoading):
                    return true 
                case (.ihideLoading, .ihideLoading):
                    return true 
                case (.ishowEmpty, .ishowEmpty):
                    return true 
                case (.ishowMosaics__mosaics(let lhsMosaics), .ishowMosaics__mosaics(let rhsMosaics)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    return true 
                case (.ishowMosaicDetail__mosaic(let lhsMosaic), .ishowMosaicDetail__mosaic(let rhsMosaic)):
                    guard Parameter.compare(lhs: lhsMosaic, rhs: rhsMosaic, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<MosaicListPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowLoading: return 0
                case .ihideLoading: return 0
                case .ishowEmpty: return 0
                case let .ishowMosaics__mosaics(p0): return p0.intValue
                case let .ishowMosaicDetail__mosaic(p0): return p0.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showLoading() -> Verify {
            return Verify(method: .ishowLoading)
        }
        static func hideLoading() -> Verify {
            return Verify(method: .ihideLoading)
        }
        static func showEmpty() -> Verify {
            return Verify(method: .ishowEmpty)
        }
        static func showMosaics(mosaics: Parameter<[MosaicImageUrl]>) -> Verify {
            return Verify(method: .ishowMosaics__mosaics(mosaics))
        }
        static func showMosaicDetail(mosaic: Parameter<MosaicImageUrl>) -> Verify {
            return Verify(method: .ishowMosaicDetail__mosaic(mosaic))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoading, performs: perform)
        }
        static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideLoading, performs: perform)
        }
        static func showEmpty(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowEmpty, performs: perform)
        }
        static func showMosaics(mosaics: Parameter<[MosaicImageUrl]>, perform: @escaping ([MosaicImageUrl]) -> Void) -> Perform {
            return Perform(method: .ishowMosaics__mosaics(mosaics), performs: perform)
        }
        static func showMosaicDetail(mosaic: Parameter<MosaicImageUrl>, perform: @escaping (MosaicImageUrl) -> Void) -> Perform {
            return Perform(method: .ishowMosaicDetail__mosaic(mosaic), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - MosaicListWireframe
class MosaicListWireframeMock: MosaicListWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NavigationDrawerInteractorOutput
class NavigationDrawerInteractorOutputMock: NavigationDrawerInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NavigationDrawerPresentation
class NavigationDrawerPresentationMock: NavigationDrawerPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: NavigationDrawerView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (NavigationDrawerView)?
    var interactor: NavigationDrawerUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("NavigationDrawerPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (NavigationDrawerUseCase)?
    var router: NavigationDrawerWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("NavigationDrawerPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (NavigationDrawerWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<NavigationDrawerView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<NavigationDrawerUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<NavigationDrawerWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickHome() {
        addInvocation(.ididClickHome)
		let perform = methodPerformValue(.ididClickHome) as? () -> Void
		perform?()
    }

    func didClickAddressBook() {
        addInvocation(.ididClickAddressBook)
		let perform = methodPerformValue(.ididClickAddressBook) as? () -> Void
		perform?()
    }

    func didClickGallery() {
        addInvocation(.ididClickGallery)
		let perform = methodPerformValue(.ididClickGallery) as? () -> Void
		perform?()
    }

    func didClickDonation() {
        addInvocation(.ididClickDonation)
		let perform = methodPerformValue(.ididClickDonation) as? () -> Void
		perform?()
    }

    func didClickAbout() {
        addInvocation(.ididClickAbout)
		let perform = methodPerformValue(.ididClickAbout) as? () -> Void
		perform?()
    }

    func didClickHelp() {
        addInvocation(.ididClickHelp)
		let perform = methodPerformValue(.ididClickHelp) as? () -> Void
		perform?()
    }

    func didClickSetting() {
        addInvocation(.ididClickSetting)
		let perform = methodPerformValue(.ididClickSetting) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickHome
        case ididClickAddressBook
        case ididClickGallery
        case ididClickDonation
        case ididClickAbout
        case ididClickHelp
        case ididClickSetting
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<NavigationDrawerView?>)
        case interactor_get
		case interactor_set(Parameter<NavigationDrawerUseCase?>)
        case router_get
		case router_set(Parameter<NavigationDrawerWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickHome, .ididClickHome):
                    return true 
                case (.ididClickAddressBook, .ididClickAddressBook):
                    return true 
                case (.ididClickGallery, .ididClickGallery):
                    return true 
                case (.ididClickDonation, .ididClickDonation):
                    return true 
                case (.ididClickAbout, .ididClickAbout):
                    return true 
                case (.ididClickHelp, .ididClickHelp):
                    return true 
                case (.ididClickSetting, .ididClickSetting):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<NavigationDrawerView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<NavigationDrawerUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<NavigationDrawerWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickHome: return 0
                case .ididClickAddressBook: return 0
                case .ididClickGallery: return 0
                case .ididClickDonation: return 0
                case .ididClickAbout: return 0
                case .ididClickHelp: return 0
                case .ididClickSetting: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickHome() -> Verify {
            return Verify(method: .ididClickHome)
        }
        static func didClickAddressBook() -> Verify {
            return Verify(method: .ididClickAddressBook)
        }
        static func didClickGallery() -> Verify {
            return Verify(method: .ididClickGallery)
        }
        static func didClickDonation() -> Verify {
            return Verify(method: .ididClickDonation)
        }
        static func didClickAbout() -> Verify {
            return Verify(method: .ididClickAbout)
        }
        static func didClickHelp() -> Verify {
            return Verify(method: .ididClickHelp)
        }
        static func didClickSetting() -> Verify {
            return Verify(method: .ididClickSetting)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickHome(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickHome, performs: perform)
        }
        static func didClickAddressBook(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickAddressBook, performs: perform)
        }
        static func didClickGallery(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGallery, performs: perform)
        }
        static func didClickDonation(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickDonation, performs: perform)
        }
        static func didClickAbout(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickAbout, performs: perform)
        }
        static func didClickHelp(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickHelp, performs: perform)
        }
        static func didClickSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickSetting, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NavigationDrawerUseCase
class NavigationDrawerUseCaseMock: NavigationDrawerUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: NavigationDrawerInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("NavigationDrawerUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (NavigationDrawerInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<NavigationDrawerInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<NavigationDrawerInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<NavigationDrawerInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NavigationDrawerView
class NavigationDrawerViewMock: NavigationDrawerView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: NavigationDrawerPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("NavigationDrawerViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (NavigationDrawerPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<NavigationDrawerPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showName(_ name: String) {
        addInvocation(.ishowName__name(Parameter<String>.value(name)))
		let perform = methodPerformValue(.ishowName__name(Parameter<String>.value(name))) as? (String) -> Void
		perform?(name)
    }

    func showAddress(_ address: String) {
        addInvocation(.ishowAddress__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ishowAddress__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowName__name(Parameter<String>)
        case ishowAddress__address(Parameter<String>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<NavigationDrawerPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowName__name(let lhsName), .ishowName__name(let rhsName)):
                    guard Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher) else { return false } 
                    return true 
                case (.ishowAddress__address(let lhsAddress), .ishowAddress__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<NavigationDrawerPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowName__name(p0): return p0.intValue
                case let .ishowAddress__address(p0): return p0.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showName(name: Parameter<String>) -> Verify {
            return Verify(method: .ishowName__name(name))
        }
        static func showAddress(address: Parameter<String>) -> Verify {
            return Verify(method: .ishowAddress__address(address))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showName(name: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowName__name(name), performs: perform)
        }
        static func showAddress(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowAddress__address(address), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NavigationDrawerWireframe
class NavigationDrawerWireframeMock: NavigationDrawerWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func dismiss() {
        addInvocation(.idismiss)
		let perform = methodPerformValue(.idismiss) as? () -> Void
		perform?()
    }

    func presentAddressBook() {
        addInvocation(.ipresentAddressBook)
		let perform = methodPerformValue(.ipresentAddressBook) as? () -> Void
		perform?()
    }

    func presentGallery() {
        addInvocation(.ipresentGallery)
		let perform = methodPerformValue(.ipresentGallery) as? () -> Void
		perform?()
    }

    func presentDonation() {
        addInvocation(.ipresentDonation)
		let perform = methodPerformValue(.ipresentDonation) as? () -> Void
		perform?()
    }

    func presentAbout() {
        addInvocation(.ipresentAbout)
		let perform = methodPerformValue(.ipresentAbout) as? () -> Void
		perform?()
    }

    func presentHelp() {
        addInvocation(.ipresentHelp)
		let perform = methodPerformValue(.ipresentHelp) as? () -> Void
		perform?()
    }

    func presentSetting() {
        addInvocation(.ipresentSetting)
		let perform = methodPerformValue(.ipresentSetting) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case idismiss
        case ipresentAddressBook
        case ipresentGallery
        case ipresentDonation
        case ipresentAbout
        case ipresentHelp
        case ipresentSetting
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.idismiss, .idismiss):
                    return true 
                case (.ipresentAddressBook, .ipresentAddressBook):
                    return true 
                case (.ipresentGallery, .ipresentGallery):
                    return true 
                case (.ipresentDonation, .ipresentDonation):
                    return true 
                case (.ipresentAbout, .ipresentAbout):
                    return true 
                case (.ipresentHelp, .ipresentHelp):
                    return true 
                case (.ipresentSetting, .ipresentSetting):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .idismiss: return 0
                case .ipresentAddressBook: return 0
                case .ipresentGallery: return 0
                case .ipresentDonation: return 0
                case .ipresentAbout: return 0
                case .ipresentHelp: return 0
                case .ipresentSetting: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func dismiss() -> Verify {
            return Verify(method: .idismiss)
        }
        static func presentAddressBook() -> Verify {
            return Verify(method: .ipresentAddressBook)
        }
        static func presentGallery() -> Verify {
            return Verify(method: .ipresentGallery)
        }
        static func presentDonation() -> Verify {
            return Verify(method: .ipresentDonation)
        }
        static func presentAbout() -> Verify {
            return Verify(method: .ipresentAbout)
        }
        static func presentHelp() -> Verify {
            return Verify(method: .ipresentHelp)
        }
        static func presentSetting() -> Verify {
            return Verify(method: .ipresentSetting)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func dismiss(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .idismiss, performs: perform)
        }
        static func presentAddressBook(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentAddressBook, performs: perform)
        }
        static func presentGallery(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentGallery, performs: perform)
        }
        static func presentDonation(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentDonation, performs: perform)
        }
        static func presentAbout(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentAbout, performs: perform)
        }
        static func presentHelp(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentHelp, performs: perform)
        }
        static func presentSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentSetting, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NodeSelectInteractorOutput
class NodeSelectInteractorOutputMock: NodeSelectInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func nodesFetched(_ nodes: [NemNode]) {
        addInvocation(.inodesFetched__nodes(Parameter<[NemNode]>.value(nodes)))
		let perform = methodPerformValue(.inodesFetched__nodes(Parameter<[NemNode]>.value(nodes))) as? ([NemNode]) -> Void
		perform?(nodes)
    }

    func nodesFetchFailed(_ error: Error) {
        addInvocation(.inodesFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.inodesFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case inodesFetched__nodes(Parameter<[NemNode]>)
        case inodesFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.inodesFetched__nodes(let lhsNodes), .inodesFetched__nodes(let rhsNodes)):
                    guard Parameter.compare(lhs: lhsNodes, rhs: rhsNodes, with: matcher) else { return false } 
                    return true 
                case (.inodesFetchFailed__error(let lhsError), .inodesFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .inodesFetched__nodes(p0): return p0.intValue
                case let .inodesFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func nodesFetched(nodes: Parameter<[NemNode]>) -> Verify {
            return Verify(method: .inodesFetched__nodes(nodes))
        }
        static func nodesFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .inodesFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func nodesFetched(nodes: Parameter<[NemNode]>, perform: @escaping ([NemNode]) -> Void) -> Perform {
            return Perform(method: .inodesFetched__nodes(nodes), performs: perform)
        }
        static func nodesFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .inodesFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NodeSelectPresentation
class NodeSelectPresentationMock: NodeSelectPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: NodeSelectView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (NodeSelectView)?
    var interactor: NodeSelectUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("NodeSelectPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (NodeSelectUseCase)?
    var router: NodeSelectWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("NodeSelectPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (NodeSelectWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<NodeSelectView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<NodeSelectUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<NodeSelectWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didSelectNode(_ node: NemNode) {
        addInvocation(.ididSelectNode__node(Parameter<NemNode>.value(node)))
		let perform = methodPerformValue(.ididSelectNode__node(Parameter<NemNode>.value(node))) as? (NemNode) -> Void
		perform?(node)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididSelectNode__node(Parameter<NemNode>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<NodeSelectView?>)
        case interactor_get
		case interactor_set(Parameter<NodeSelectUseCase?>)
        case router_get
		case router_set(Parameter<NodeSelectWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididSelectNode__node(let lhsNode), .ididSelectNode__node(let rhsNode)):
                    guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<NodeSelectView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<NodeSelectUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<NodeSelectWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ididSelectNode__node(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didSelectNode(node: Parameter<NemNode>) -> Verify {
            return Verify(method: .ididSelectNode__node(node))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didSelectNode(node: Parameter<NemNode>, perform: @escaping (NemNode) -> Void) -> Perform {
            return Perform(method: .ididSelectNode__node(node), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NodeSelectUseCase
class NodeSelectUseCaseMock: NodeSelectUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: NodeSelectInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("NodeSelectUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (NodeSelectInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<NodeSelectInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchNodes() {
        addInvocation(.ifetchNodes)
		let perform = methodPerformValue(.ifetchNodes) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ifetchNodes
        case output_get
		case output_set(Parameter<NodeSelectInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchNodes, .ifetchNodes):
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<NodeSelectInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ifetchNodes: return 0
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchNodes() -> Verify {
            return Verify(method: .ifetchNodes)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchNodes(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ifetchNodes, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NodeSelectView
class NodeSelectViewMock: NodeSelectView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: NodeSelectPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("NodeSelectViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (NodeSelectPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<NodeSelectPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showLoading() {
        addInvocation(.ishowLoading)
		let perform = methodPerformValue(.ishowLoading) as? () -> Void
		perform?()
    }

    func hideLoading() {
        addInvocation(.ihideLoading)
		let perform = methodPerformValue(.ihideLoading) as? () -> Void
		perform?()
    }

    func showActiveNode(_ activeNodeUrl: String) {
        addInvocation(.ishowActiveNode__activeNodeUrl(Parameter<String>.value(activeNodeUrl)))
		let perform = methodPerformValue(.ishowActiveNode__activeNodeUrl(Parameter<String>.value(activeNodeUrl))) as? (String) -> Void
		perform?(activeNodeUrl)
    }

    func showNodes(_ nodes: [NemNode]) {
        addInvocation(.ishowNodes__nodes(Parameter<[NemNode]>.value(nodes)))
		let perform = methodPerformValue(.ishowNodes__nodes(Parameter<[NemNode]>.value(nodes))) as? ([NemNode]) -> Void
		perform?(nodes)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowLoading
        case ihideLoading
        case ishowActiveNode__activeNodeUrl(Parameter<String>)
        case ishowNodes__nodes(Parameter<[NemNode]>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<NodeSelectPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowLoading, .ishowLoading):
                    return true 
                case (.ihideLoading, .ihideLoading):
                    return true 
                case (.ishowActiveNode__activeNodeUrl(let lhsActivenodeurl), .ishowActiveNode__activeNodeUrl(let rhsActivenodeurl)):
                    guard Parameter.compare(lhs: lhsActivenodeurl, rhs: rhsActivenodeurl, with: matcher) else { return false } 
                    return true 
                case (.ishowNodes__nodes(let lhsNodes), .ishowNodes__nodes(let rhsNodes)):
                    guard Parameter.compare(lhs: lhsNodes, rhs: rhsNodes, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<NodeSelectPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowLoading: return 0
                case .ihideLoading: return 0
                case let .ishowActiveNode__activeNodeUrl(p0): return p0.intValue
                case let .ishowNodes__nodes(p0): return p0.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showLoading() -> Verify {
            return Verify(method: .ishowLoading)
        }
        static func hideLoading() -> Verify {
            return Verify(method: .ihideLoading)
        }
        static func showActiveNode(activeNodeUrl: Parameter<String>) -> Verify {
            return Verify(method: .ishowActiveNode__activeNodeUrl(activeNodeUrl))
        }
        static func showNodes(nodes: Parameter<[NemNode]>) -> Verify {
            return Verify(method: .ishowNodes__nodes(nodes))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoading, performs: perform)
        }
        static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideLoading, performs: perform)
        }
        static func showActiveNode(activeNodeUrl: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowActiveNode__activeNodeUrl(activeNodeUrl), performs: perform)
        }
        static func showNodes(nodes: Parameter<[NemNode]>, perform: @escaping ([NemNode]) -> Void) -> Perform {
            return Perform(method: .ishowNodes__nodes(nodes), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - NodeSelectWireframe
class NodeSelectWireframeMock: NodeSelectWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - PinDialogInteractorOutput
class PinDialogInteractorOutputMock: PinDialogInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func pinValidated(_ result: Bool) {
        addInvocation(.ipinValidated__result(Parameter<Bool>.value(result)))
		let perform = methodPerformValue(.ipinValidated__result(Parameter<Bool>.value(result))) as? (Bool) -> Void
		perform?(result)
    }

    func pinRegistered(_ result: Bool) {
        addInvocation(.ipinRegistered__result(Parameter<Bool>.value(result)))
		let perform = methodPerformValue(.ipinRegistered__result(Parameter<Bool>.value(result))) as? (Bool) -> Void
		perform?(result)
    }

    fileprivate enum MethodType {
        case ipinValidated__result(Parameter<Bool>)
        case ipinRegistered__result(Parameter<Bool>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipinValidated__result(let lhsResult), .ipinValidated__result(let rhsResult)):
                    guard Parameter.compare(lhs: lhsResult, rhs: rhsResult, with: matcher) else { return false } 
                    return true 
                case (.ipinRegistered__result(let lhsResult), .ipinRegistered__result(let rhsResult)):
                    guard Parameter.compare(lhs: lhsResult, rhs: rhsResult, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipinValidated__result(p0): return p0.intValue
                case let .ipinRegistered__result(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func pinValidated(result: Parameter<Bool>) -> Verify {
            return Verify(method: .ipinValidated__result(result))
        }
        static func pinRegistered(result: Parameter<Bool>) -> Verify {
            return Verify(method: .ipinRegistered__result(result))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func pinValidated(result: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ipinValidated__result(result), performs: perform)
        }
        static func pinRegistered(result: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ipinRegistered__result(result), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - PinDialogPresentation
class PinDialogPresentationMock: PinDialogPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: PinDialogView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (PinDialogView)?
    var interactor: PinDialogUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("PinDialogPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (PinDialogUseCase)?
    var router: PinDialogWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("PinDialogPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (PinDialogWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<PinDialogView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<PinDialogUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<PinDialogWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickNumber(_ number: Int) {
        addInvocation(.ididClickNumber__number(Parameter<Int>.value(number)))
		let perform = methodPerformValue(.ididClickNumber__number(Parameter<Int>.value(number))) as? (Int) -> Void
		perform?(number)
    }

    func didClickCancel() {
        addInvocation(.ididClickCancel)
		let perform = methodPerformValue(.ididClickCancel) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickNumber__number(Parameter<Int>)
        case ididClickCancel
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<PinDialogView?>)
        case interactor_get
		case interactor_set(Parameter<PinDialogUseCase?>)
        case router_get
		case router_set(Parameter<PinDialogWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickNumber__number(let lhsNumber), .ididClickNumber__number(let rhsNumber)):
                    guard Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher) else { return false } 
                    return true 
                case (.ididClickCancel, .ididClickCancel):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<PinDialogView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<PinDialogUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<PinDialogWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ididClickNumber__number(p0): return p0.intValue
                case .ididClickCancel: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickNumber(number: Parameter<Int>) -> Verify {
            return Verify(method: .ididClickNumber__number(number))
        }
        static func didClickCancel() -> Verify {
            return Verify(method: .ididClickCancel)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickNumber(number: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .ididClickNumber__number(number), performs: perform)
        }
        static func didClickCancel(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickCancel, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - PinDialogUseCase
class PinDialogUseCaseMock: PinDialogUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: PinDialogInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("PinDialogUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (PinDialogInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<PinDialogInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func validateCode(_ pin: String) {
        addInvocation(.ivalidateCode__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ivalidateCode__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func registerCode(_ oldCode: String, _ newCode: String) {
        addInvocation(.iregisterCode__oldCode_newCode(Parameter<String>.value(oldCode), Parameter<String>.value(newCode)))
		let perform = methodPerformValue(.iregisterCode__oldCode_newCode(Parameter<String>.value(oldCode), Parameter<String>.value(newCode))) as? (String, String) -> Void
		perform?(oldCode, newCode)
    }

    fileprivate enum MethodType {
        case ivalidateCode__pin(Parameter<String>)
        case iregisterCode__oldCode_newCode(Parameter<String>, Parameter<String>)
        case output_get
		case output_set(Parameter<PinDialogInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ivalidateCode__pin(let lhsPin), .ivalidateCode__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.iregisterCode__oldCode_newCode(let lhsOldcode, let lhsNewcode), .iregisterCode__oldCode_newCode(let rhsOldcode, let rhsNewcode)):
                    guard Parameter.compare(lhs: lhsOldcode, rhs: rhsOldcode, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsNewcode, rhs: rhsNewcode, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<PinDialogInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ivalidateCode__pin(p0): return p0.intValue
                case let .iregisterCode__oldCode_newCode(p0, p1): return p0.intValue + p1.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func validateCode(pin: Parameter<String>) -> Verify {
            return Verify(method: .ivalidateCode__pin(pin))
        }
        static func registerCode(oldCode: Parameter<String>, newCode: Parameter<String>) -> Verify {
            return Verify(method: .iregisterCode__oldCode_newCode(oldCode, newCode))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func validateCode(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ivalidateCode__pin(pin), performs: perform)
        }
        static func registerCode(oldCode: Parameter<String>, newCode: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .iregisterCode__oldCode_newCode(oldCode, newCode), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - PinDialogView
class PinDialogViewMock: PinDialogView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: PinDialogPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("PinDialogViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (PinDialogPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<PinDialogPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showMessage(_ message: String) {
        addInvocation(.ishowMessage__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowMessage__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showInputted(_ count: Int) {
        addInvocation(.ishowInputted__count(Parameter<Int>.value(count)))
		let perform = methodPerformValue(.ishowInputted__count(Parameter<Int>.value(count))) as? (Int) -> Void
		perform?(count)
    }

    func showResult(_ result: Bool) {
        addInvocation(.ishowResult__result(Parameter<Bool>.value(result)))
		let perform = methodPerformValue(.ishowResult__result(Parameter<Bool>.value(result))) as? (Bool) -> Void
		perform?(result)
    }

    func showRegistrationMessage() {
        addInvocation(.ishowRegistrationMessage)
		let perform = methodPerformValue(.ishowRegistrationMessage) as? () -> Void
		perform?()
    }

    func hideCancel() {
        addInvocation(.ihideCancel)
		let perform = methodPerformValue(.ihideCancel) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowMessage__message(Parameter<String>)
        case ishowInputted__count(Parameter<Int>)
        case ishowResult__result(Parameter<Bool>)
        case ishowRegistrationMessage
        case ihideCancel
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<PinDialogPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowMessage__message(let lhsMessage), .ishowMessage__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowInputted__count(let lhsCount), .ishowInputted__count(let rhsCount)):
                    guard Parameter.compare(lhs: lhsCount, rhs: rhsCount, with: matcher) else { return false } 
                    return true 
                case (.ishowResult__result(let lhsResult), .ishowResult__result(let rhsResult)):
                    guard Parameter.compare(lhs: lhsResult, rhs: rhsResult, with: matcher) else { return false } 
                    return true 
                case (.ishowRegistrationMessage, .ishowRegistrationMessage):
                    return true 
                case (.ihideCancel, .ihideCancel):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<PinDialogPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowMessage__message(p0): return p0.intValue
                case let .ishowInputted__count(p0): return p0.intValue
                case let .ishowResult__result(p0): return p0.intValue
                case .ishowRegistrationMessage: return 0
                case .ihideCancel: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showMessage(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowMessage__message(message))
        }
        static func showInputted(count: Parameter<Int>) -> Verify {
            return Verify(method: .ishowInputted__count(count))
        }
        static func showResult(result: Parameter<Bool>) -> Verify {
            return Verify(method: .ishowResult__result(result))
        }
        static func showRegistrationMessage() -> Verify {
            return Verify(method: .ishowRegistrationMessage)
        }
        static func hideCancel() -> Verify {
            return Verify(method: .ihideCancel)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showMessage(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowMessage__message(message), performs: perform)
        }
        static func showInputted(count: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .ishowInputted__count(count), performs: perform)
        }
        static func showResult(result: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ishowResult__result(result), performs: perform)
        }
        static func showRegistrationMessage(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowRegistrationMessage, performs: perform)
        }
        static func hideCancel(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideCancel, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - PinDialogWireframe
class PinDialogWireframeMock: PinDialogWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(forRegistration: Bool, cancelable: Bool, handler: ((String?) -> Void)?) -> UIViewController {
        addInvocation(.sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<((String?) -> Void)?>.value(handler)))
		let perform = methodPerformValue(.sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<((String?) -> Void)?>.value(handler))) as? (Bool, Bool, ((String?) -> Void)?) -> Void
		perform?(forRegistration, cancelable, handler)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<((String?) -> Void)?>.value(handler)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(forRegistration: Bool, cancelable: Bool, handler: ((String?) -> Void)?). Use given")
    }

    func dismiss(pin: String?, _ handler: ((String?) -> Void)?) {
        addInvocation(.idismiss__pin_pin_handler(Parameter<String?>.value(pin), Parameter<((String?) -> Void)?>.value(handler)))
		let perform = methodPerformValue(.idismiss__pin_pin_handler(Parameter<String?>.value(pin), Parameter<((String?) -> Void)?>.value(handler))) as? (String?, ((String?) -> Void)?) -> Void
		perform?(pin, handler)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(Parameter<Bool>, Parameter<Bool>, Parameter<((String?) -> Void)?>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(let lhsForregistration, let lhsCancelable, let lhsHandler), .sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(let rhsForregistration, let rhsCancelable, let rhsHandler)):
                    guard Parameter.compare(lhs: lhsForregistration, rhs: rhsForregistration, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsCancelable, rhs: rhsCancelable, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsHandler, rhs: rhsHandler, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, handler: Parameter<((String?) -> Void)?>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(forRegistration, cancelable, handler), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, handler: Parameter<((String?) -> Void)?>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(forRegistration, cancelable, handler))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, handler: Parameter<((String?) -> Void)?>, perform: @escaping (Bool, Bool, ((String?) -> Void)?) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__forRegistration_forRegistrationcancelable_cancelablehandler_handler(forRegistration, cancelable, handler), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case idismiss__pin_pin_handler(Parameter<String?>, Parameter<((String?) -> Void)?>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.idismiss__pin_pin_handler(let lhsPin, let lhsHandler), .idismiss__pin_pin_handler(let rhsPin, let rhsHandler)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsHandler, rhs: rhsHandler, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .idismiss__pin_pin_handler(p0, p1): return p0.intValue + p1.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func dismiss(pin: Parameter<String?>, handler: Parameter<((String?) -> Void)?>) -> Verify {
            return Verify(method: .idismiss__pin_pin_handler(pin, handler))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func dismiss(pin: Parameter<String?>, handler: Parameter<((String?) -> Void)?>, perform: @escaping (String?, ((String?) -> Void)?) -> Void) -> Perform {
            return Perform(method: .idismiss__pin_pin_handler(pin, handler), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - ScanTabInteractorOutput
class ScanTabInteractorOutputMock: ScanTabInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func publicKeyFetched(_ publicKey: String?) {
        addInvocation(.ipublicKeyFetched__publicKey(Parameter<String?>.value(publicKey)))
		let perform = methodPerformValue(.ipublicKeyFetched__publicKey(Parameter<String?>.value(publicKey))) as? (String?) -> Void
		perform?(publicKey)
    }

    func publicKeyFetchFailed(_ error: Error) {
        addInvocation(.ipublicKeyFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.ipublicKeyFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case ipublicKeyFetched__publicKey(Parameter<String?>)
        case ipublicKeyFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipublicKeyFetched__publicKey(let lhsPublickey), .ipublicKeyFetched__publicKey(let rhsPublickey)):
                    guard Parameter.compare(lhs: lhsPublickey, rhs: rhsPublickey, with: matcher) else { return false } 
                    return true 
                case (.ipublicKeyFetchFailed__error(let lhsError), .ipublicKeyFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipublicKeyFetched__publicKey(p0): return p0.intValue
                case let .ipublicKeyFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func publicKeyFetched(publicKey: Parameter<String?>) -> Verify {
            return Verify(method: .ipublicKeyFetched__publicKey(publicKey))
        }
        static func publicKeyFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .ipublicKeyFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func publicKeyFetched(publicKey: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .ipublicKeyFetched__publicKey(publicKey), performs: perform)
        }
        static func publicKeyFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .ipublicKeyFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - ScanTabPresentation
class ScanTabPresentationMock: ScanTabPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: ScanTabView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (ScanTabView)?
    var interactor: ScanTabUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("ScanTabPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (ScanTabUseCase)?
    var router: ScanTabWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("ScanTabPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (ScanTabWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<ScanTabView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<ScanTabUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<ScanTabWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didScanAddress(_ address: String) {
        addInvocation(.ididScanAddress__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ididScanAddress__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    func didScanInvoice(_ invoice: InvoiceQr) {
        addInvocation(.ididScanInvoice__invoice(Parameter<InvoiceQr>.value(invoice)))
		let perform = methodPerformValue(.ididScanInvoice__invoice(Parameter<InvoiceQr>.value(invoice))) as? (InvoiceQr) -> Void
		perform?(invoice)
    }

    func didCatchError(_ message: String) {
        addInvocation(.ididCatchError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ididCatchError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func didClickGoPinSetting() {
        addInvocation(.ididClickGoPinSetting)
		let perform = methodPerformValue(.ididClickGoPinSetting) as? () -> Void
		perform?()
    }

    func didClickGoWalletSelect() {
        addInvocation(.ididClickGoWalletSelect)
		let perform = methodPerformValue(.ididClickGoWalletSelect) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididScanAddress__address(Parameter<String>)
        case ididScanInvoice__invoice(Parameter<InvoiceQr>)
        case ididCatchError__message(Parameter<String>)
        case ididClickGoPinSetting
        case ididClickGoWalletSelect
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<ScanTabView?>)
        case interactor_get
		case interactor_set(Parameter<ScanTabUseCase?>)
        case router_get
		case router_set(Parameter<ScanTabWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididScanAddress__address(let lhsAddress), .ididScanAddress__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.ididScanInvoice__invoice(let lhsInvoice), .ididScanInvoice__invoice(let rhsInvoice)):
                    guard Parameter.compare(lhs: lhsInvoice, rhs: rhsInvoice, with: matcher) else { return false } 
                    return true 
                case (.ididCatchError__message(let lhsMessage), .ididCatchError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ididClickGoPinSetting, .ididClickGoPinSetting):
                    return true 
                case (.ididClickGoWalletSelect, .ididClickGoWalletSelect):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<ScanTabView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<ScanTabUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<ScanTabWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ididScanAddress__address(p0): return p0.intValue
                case let .ididScanInvoice__invoice(p0): return p0.intValue
                case let .ididCatchError__message(p0): return p0.intValue
                case .ididClickGoPinSetting: return 0
                case .ididClickGoWalletSelect: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didScanAddress(address: Parameter<String>) -> Verify {
            return Verify(method: .ididScanAddress__address(address))
        }
        static func didScanInvoice(invoice: Parameter<InvoiceQr>) -> Verify {
            return Verify(method: .ididScanInvoice__invoice(invoice))
        }
        static func didCatchError(message: Parameter<String>) -> Verify {
            return Verify(method: .ididCatchError__message(message))
        }
        static func didClickGoPinSetting() -> Verify {
            return Verify(method: .ididClickGoPinSetting)
        }
        static func didClickGoWalletSelect() -> Verify {
            return Verify(method: .ididClickGoWalletSelect)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didScanAddress(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididScanAddress__address(address), performs: perform)
        }
        static func didScanInvoice(invoice: Parameter<InvoiceQr>, perform: @escaping (InvoiceQr) -> Void) -> Perform {
            return Perform(method: .ididScanInvoice__invoice(invoice), performs: perform)
        }
        static func didCatchError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididCatchError__message(message), performs: perform)
        }
        static func didClickGoPinSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGoPinSetting, performs: perform)
        }
        static func didClickGoWalletSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGoWalletSelect, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - ScanTabUseCase
class ScanTabUseCaseMock: ScanTabUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: ScanTabInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("ScanTabUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (ScanTabInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<ScanTabInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchPublicKey(_ address: String) {
        addInvocation(.ifetchPublicKey__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ifetchPublicKey__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    fileprivate enum MethodType {
        case ifetchPublicKey__address(Parameter<String>)
        case output_get
		case output_set(Parameter<ScanTabInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchPublicKey__address(let lhsAddress), .ifetchPublicKey__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<ScanTabInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ifetchPublicKey__address(p0): return p0.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchPublicKey(address: Parameter<String>) -> Verify {
            return Verify(method: .ifetchPublicKey__address(address))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchPublicKey(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ifetchPublicKey__address(address), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - ScanTabView
class ScanTabViewMock: ScanTabView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: ScanTabPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("ScanTabViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (ScanTabPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<ScanTabPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func startScan() {
        addInvocation(.istartScan)
		let perform = methodPerformValue(.istartScan) as? () -> Void
		perform?()
    }

    func stopScan() {
        addInvocation(.istopScan)
		let perform = methodPerformValue(.istopScan) as? () -> Void
		perform?()
    }

    func showLoading() {
        addInvocation(.ishowLoading)
		let perform = methodPerformValue(.ishowLoading) as? () -> Void
		perform?()
    }

    func hideLoading() {
        addInvocation(.ihideLoading)
		let perform = methodPerformValue(.ihideLoading) as? () -> Void
		perform?()
    }

    func pause(_ isPaused: Bool) {
        addInvocation(.ipause__isPaused(Parameter<Bool>.value(isPaused)))
		let perform = methodPerformValue(.ipause__isPaused(Parameter<Bool>.value(isPaused))) as? (Bool) -> Void
		perform?(isPaused)
    }

    func showNotSetPinError() {
        addInvocation(.ishowNotSetPinError)
		let perform = methodPerformValue(.ishowNotSetPinError) as? () -> Void
		perform?()
    }

    func showNotSelectWalletError() {
        addInvocation(.ishowNotSelectWalletError)
		let perform = methodPerformValue(.ishowNotSelectWalletError) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case istartScan
        case istopScan
        case ishowLoading
        case ihideLoading
        case ipause__isPaused(Parameter<Bool>)
        case ishowNotSetPinError
        case ishowNotSelectWalletError
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<ScanTabPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.istartScan, .istartScan):
                    return true 
                case (.istopScan, .istopScan):
                    return true 
                case (.ishowLoading, .ishowLoading):
                    return true 
                case (.ihideLoading, .ihideLoading):
                    return true 
                case (.ipause__isPaused(let lhsIspaused), .ipause__isPaused(let rhsIspaused)):
                    guard Parameter.compare(lhs: lhsIspaused, rhs: rhsIspaused, with: matcher) else { return false } 
                    return true 
                case (.ishowNotSetPinError, .ishowNotSetPinError):
                    return true 
                case (.ishowNotSelectWalletError, .ishowNotSelectWalletError):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<ScanTabPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .istartScan: return 0
                case .istopScan: return 0
                case .ishowLoading: return 0
                case .ihideLoading: return 0
                case let .ipause__isPaused(p0): return p0.intValue
                case .ishowNotSetPinError: return 0
                case .ishowNotSelectWalletError: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func startScan() -> Verify {
            return Verify(method: .istartScan)
        }
        static func stopScan() -> Verify {
            return Verify(method: .istopScan)
        }
        static func showLoading() -> Verify {
            return Verify(method: .ishowLoading)
        }
        static func hideLoading() -> Verify {
            return Verify(method: .ihideLoading)
        }
        static func pause(isPaused: Parameter<Bool>) -> Verify {
            return Verify(method: .ipause__isPaused(isPaused))
        }
        static func showNotSetPinError() -> Verify {
            return Verify(method: .ishowNotSetPinError)
        }
        static func showNotSelectWalletError() -> Verify {
            return Verify(method: .ishowNotSelectWalletError)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func startScan(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .istartScan, performs: perform)
        }
        static func stopScan(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .istopScan, performs: perform)
        }
        static func showLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoading, performs: perform)
        }
        static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideLoading, performs: perform)
        }
        static func pause(isPaused: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ipause__isPaused(isPaused), performs: perform)
        }
        static func showNotSetPinError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowNotSetPinError, performs: perform)
        }
        static func showNotSelectWalletError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowNotSelectWalletError, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - ScanTabWireframe
class ScanTabWireframeMock: ScanTabWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentSendAmount(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendAmount__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendAmount__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    func presentSendMode(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendMode__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendMode__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    func presentSendConfirmation(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    func presentSetting() {
        addInvocation(.ipresentSetting)
		let perform = methodPerformValue(.ipresentSetting) as? () -> Void
		perform?()
    }

    func presentWalletSelect() {
        addInvocation(.ipresentWalletSelect)
		let perform = methodPerformValue(.ipresentWalletSelect) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentSendAmount__sendTransaction(Parameter<SendTransaction>)
        case ipresentSendMode__sendTransaction(Parameter<SendTransaction>)
        case ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>)
        case ipresentSetting
        case ipresentWalletSelect
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentSendAmount__sendTransaction(let lhsSendtransaction), .ipresentSendAmount__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.ipresentSendMode__sendTransaction(let lhsSendtransaction), .ipresentSendMode__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.ipresentSendConfirmation__sendTransaction(let lhsSendtransaction), .ipresentSendConfirmation__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.ipresentSetting, .ipresentSetting):
                    return true 
                case (.ipresentWalletSelect, .ipresentWalletSelect):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentSendAmount__sendTransaction(p0): return p0.intValue
                case let .ipresentSendMode__sendTransaction(p0): return p0.intValue
                case let .ipresentSendConfirmation__sendTransaction(p0): return p0.intValue
                case .ipresentSetting: return 0
                case .ipresentWalletSelect: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentSendAmount(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendAmount__sendTransaction(sendTransaction))
        }
        static func presentSendMode(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendMode__sendTransaction(sendTransaction))
        }
        static func presentSendConfirmation(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendConfirmation__sendTransaction(sendTransaction))
        }
        static func presentSetting() -> Verify {
            return Verify(method: .ipresentSetting)
        }
        static func presentWalletSelect() -> Verify {
            return Verify(method: .ipresentWalletSelect)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentSendAmount(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendAmount__sendTransaction(sendTransaction), performs: perform)
        }
        static func presentSendMode(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendMode__sendTransaction(sendTransaction), performs: perform)
        }
        static func presentSendConfirmation(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendConfirmation__sendTransaction(sendTransaction), performs: perform)
        }
        static func presentSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentSetting, performs: perform)
        }
        static func presentWalletSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentWalletSelect, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendAmountInteractorOutput
class SendAmountInteractorOutputMock: SendAmountInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        addInvocation(.imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>.value(mosaics)))
		let perform = methodPerformValue(.imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>.value(mosaics))) as? ([MosaicDetail]) -> Void
		perform?(mosaics)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        addInvocation(.imosaicOwnedFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.imosaicOwnedFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case imosaicOwnedFetched__mosaics(Parameter<[MosaicDetail]>)
        case imosaicOwnedFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.imosaicOwnedFetched__mosaics(let lhsMosaics), .imosaicOwnedFetched__mosaics(let rhsMosaics)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    return true 
                case (.imosaicOwnedFetchFailed__error(let lhsError), .imosaicOwnedFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .imosaicOwnedFetched__mosaics(p0): return p0.intValue
                case let .imosaicOwnedFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func mosaicOwnedFetched(mosaics: Parameter<[MosaicDetail]>) -> Verify {
            return Verify(method: .imosaicOwnedFetched__mosaics(mosaics))
        }
        static func mosaicOwnedFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .imosaicOwnedFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func mosaicOwnedFetched(mosaics: Parameter<[MosaicDetail]>, perform: @escaping ([MosaicDetail]) -> Void) -> Perform {
            return Perform(method: .imosaicOwnedFetched__mosaics(mosaics), performs: perform)
        }
        static func mosaicOwnedFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .imosaicOwnedFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendAmountPresentation
class SendAmountPresentationMock: SendAmountPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SendAmountView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SendAmountView)?
    var interactor: SendAmountUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SendAmountPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SendAmountUseCase)?
    var router: SendAmountWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SendAmountPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SendAmountWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SendAmountView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SendAmountUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SendAmountWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickMosaicTab() {
        addInvocation(.ididClickMosaicTab)
		let perform = methodPerformValue(.ididClickMosaicTab) as? () -> Void
		perform?()
    }

    func didClickAmountTab() {
        addInvocation(.ididClickAmountTab)
		let perform = methodPerformValue(.ididClickAmountTab) as? () -> Void
		perform?()
    }

    func didChangeAmountPage(_ pageIndex: Int) {
        addInvocation(.ididChangeAmountPage__pageIndex(Parameter<Int>.value(pageIndex)))
		let perform = methodPerformValue(.ididChangeAmountPage__pageIndex(Parameter<Int>.value(pageIndex))) as? (Int) -> Void
		perform?(pageIndex)
    }

    func didChangeFormula(_ formula: String) {
        addInvocation(.ididChangeFormula__formula(Parameter<String>.value(formula)))
		let perform = methodPerformValue(.ididChangeFormula__formula(Parameter<String>.value(formula))) as? (String) -> Void
		perform?(formula)
    }

    func didCalculateFormula(_ value: Decimal) {
        addInvocation(.ididCalculateFormula__value(Parameter<Decimal>.value(value)))
		let perform = methodPerformValue(.ididCalculateFormula__value(Parameter<Decimal>.value(value))) as? (Decimal) -> Void
		perform?(value)
    }

    func didConfirm() {
        addInvocation(.ididConfirm)
		let perform = methodPerformValue(.ididConfirm) as? () -> Void
		perform?()
    }

    func didChangeMosaicWithXem(_ withXem: Bool) {
        addInvocation(.ididChangeMosaicWithXem__withXem(Parameter<Bool>.value(withXem)))
		let perform = methodPerformValue(.ididChangeMosaicWithXem__withXem(Parameter<Bool>.value(withXem))) as? (Bool) -> Void
		perform?(withXem)
    }

    func didSelectMosaicOwned(_ mosaic: MosaicDetail) {
        addInvocation(.ididSelectMosaicOwned__mosaic(Parameter<MosaicDetail>.value(mosaic)))
		let perform = methodPerformValue(.ididSelectMosaicOwned__mosaic(Parameter<MosaicDetail>.value(mosaic))) as? (MosaicDetail) -> Void
		perform?(mosaic)
    }

    func didDeselectMosaicOwned(_ mosaic: MosaicDetail) {
        addInvocation(.ididDeselectMosaicOwned__mosaic(Parameter<MosaicDetail>.value(mosaic)))
		let perform = methodPerformValue(.ididDeselectMosaicOwned__mosaic(Parameter<MosaicDetail>.value(mosaic))) as? (MosaicDetail) -> Void
		perform?(mosaic)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickMosaicTab
        case ididClickAmountTab
        case ididChangeAmountPage__pageIndex(Parameter<Int>)
        case ididChangeFormula__formula(Parameter<String>)
        case ididCalculateFormula__value(Parameter<Decimal>)
        case ididConfirm
        case ididChangeMosaicWithXem__withXem(Parameter<Bool>)
        case ididSelectMosaicOwned__mosaic(Parameter<MosaicDetail>)
        case ididDeselectMosaicOwned__mosaic(Parameter<MosaicDetail>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<SendAmountView?>)
        case interactor_get
		case interactor_set(Parameter<SendAmountUseCase?>)
        case router_get
		case router_set(Parameter<SendAmountWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickMosaicTab, .ididClickMosaicTab):
                    return true 
                case (.ididClickAmountTab, .ididClickAmountTab):
                    return true 
                case (.ididChangeAmountPage__pageIndex(let lhsPageindex), .ididChangeAmountPage__pageIndex(let rhsPageindex)):
                    guard Parameter.compare(lhs: lhsPageindex, rhs: rhsPageindex, with: matcher) else { return false } 
                    return true 
                case (.ididChangeFormula__formula(let lhsFormula), .ididChangeFormula__formula(let rhsFormula)):
                    guard Parameter.compare(lhs: lhsFormula, rhs: rhsFormula, with: matcher) else { return false } 
                    return true 
                case (.ididCalculateFormula__value(let lhsValue), .ididCalculateFormula__value(let rhsValue)):
                    guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                    return true 
                case (.ididConfirm, .ididConfirm):
                    return true 
                case (.ididChangeMosaicWithXem__withXem(let lhsWithxem), .ididChangeMosaicWithXem__withXem(let rhsWithxem)):
                    guard Parameter.compare(lhs: lhsWithxem, rhs: rhsWithxem, with: matcher) else { return false } 
                    return true 
                case (.ididSelectMosaicOwned__mosaic(let lhsMosaic), .ididSelectMosaicOwned__mosaic(let rhsMosaic)):
                    guard Parameter.compare(lhs: lhsMosaic, rhs: rhsMosaic, with: matcher) else { return false } 
                    return true 
                case (.ididDeselectMosaicOwned__mosaic(let lhsMosaic), .ididDeselectMosaicOwned__mosaic(let rhsMosaic)):
                    guard Parameter.compare(lhs: lhsMosaic, rhs: rhsMosaic, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SendAmountView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SendAmountUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SendAmountWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickMosaicTab: return 0
                case .ididClickAmountTab: return 0
                case let .ididChangeAmountPage__pageIndex(p0): return p0.intValue
                case let .ididChangeFormula__formula(p0): return p0.intValue
                case let .ididCalculateFormula__value(p0): return p0.intValue
                case .ididConfirm: return 0
                case let .ididChangeMosaicWithXem__withXem(p0): return p0.intValue
                case let .ididSelectMosaicOwned__mosaic(p0): return p0.intValue
                case let .ididDeselectMosaicOwned__mosaic(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickMosaicTab() -> Verify {
            return Verify(method: .ididClickMosaicTab)
        }
        static func didClickAmountTab() -> Verify {
            return Verify(method: .ididClickAmountTab)
        }
        static func didChangeAmountPage(pageIndex: Parameter<Int>) -> Verify {
            return Verify(method: .ididChangeAmountPage__pageIndex(pageIndex))
        }
        static func didChangeFormula(formula: Parameter<String>) -> Verify {
            return Verify(method: .ididChangeFormula__formula(formula))
        }
        static func didCalculateFormula(value: Parameter<Decimal>) -> Verify {
            return Verify(method: .ididCalculateFormula__value(value))
        }
        static func didConfirm() -> Verify {
            return Verify(method: .ididConfirm)
        }
        static func didChangeMosaicWithXem(withXem: Parameter<Bool>) -> Verify {
            return Verify(method: .ididChangeMosaicWithXem__withXem(withXem))
        }
        static func didSelectMosaicOwned(mosaic: Parameter<MosaicDetail>) -> Verify {
            return Verify(method: .ididSelectMosaicOwned__mosaic(mosaic))
        }
        static func didDeselectMosaicOwned(mosaic: Parameter<MosaicDetail>) -> Verify {
            return Verify(method: .ididDeselectMosaicOwned__mosaic(mosaic))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickMosaicTab(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickMosaicTab, performs: perform)
        }
        static func didClickAmountTab(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickAmountTab, performs: perform)
        }
        static func didChangeAmountPage(pageIndex: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .ididChangeAmountPage__pageIndex(pageIndex), performs: perform)
        }
        static func didChangeFormula(formula: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididChangeFormula__formula(formula), performs: perform)
        }
        static func didCalculateFormula(value: Parameter<Decimal>, perform: @escaping (Decimal) -> Void) -> Perform {
            return Perform(method: .ididCalculateFormula__value(value), performs: perform)
        }
        static func didConfirm(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididConfirm, performs: perform)
        }
        static func didChangeMosaicWithXem(withXem: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ididChangeMosaicWithXem__withXem(withXem), performs: perform)
        }
        static func didSelectMosaicOwned(mosaic: Parameter<MosaicDetail>, perform: @escaping (MosaicDetail) -> Void) -> Perform {
            return Perform(method: .ididSelectMosaicOwned__mosaic(mosaic), performs: perform)
        }
        static func didDeselectMosaicOwned(mosaic: Parameter<MosaicDetail>, perform: @escaping (MosaicDetail) -> Void) -> Perform {
            return Perform(method: .ididDeselectMosaicOwned__mosaic(mosaic), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendAmountUseCase
class SendAmountUseCaseMock: SendAmountUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SendAmountInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SendAmountUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SendAmountInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SendAmountInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchMosaicOwned(_ address: String) {
        addInvocation(.ifetchMosaicOwned__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ifetchMosaicOwned__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    fileprivate enum MethodType {
        case ifetchMosaicOwned__address(Parameter<String>)
        case output_get
		case output_set(Parameter<SendAmountInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchMosaicOwned__address(let lhsAddress), .ifetchMosaicOwned__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SendAmountInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ifetchMosaicOwned__address(p0): return p0.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchMosaicOwned(address: Parameter<String>) -> Verify {
            return Verify(method: .ifetchMosaicOwned__address(address))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchMosaicOwned(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ifetchMosaicOwned__address(address), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendAmountView
class SendAmountViewMock: SendAmountView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SendAmountPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SendAmountViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SendAmountPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SendAmountPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showAmount() {
        addInvocation(.ishowAmount)
		let perform = methodPerformValue(.ishowAmount) as? () -> Void
		perform?()
    }

    func showMosaic() {
        addInvocation(.ishowMosaic)
		let perform = methodPerformValue(.ishowMosaic) as? () -> Void
		perform?()
    }

    func showFirstAmountPage() {
        addInvocation(.ishowFirstAmountPage)
		let perform = methodPerformValue(.ishowFirstAmountPage) as? () -> Void
		perform?()
    }

    func setAmounts(_ amounts: [String]) {
        addInvocation(.isetAmounts__amounts(Parameter<[String]>.value(amounts)))
		let perform = methodPerformValue(.isetAmounts__amounts(Parameter<[String]>.value(amounts))) as? ([String]) -> Void
		perform?(amounts)
    }

    func setFormula(_ formula: String) {
        addInvocation(.isetFormula__formula(Parameter<String>.value(formula)))
		let perform = methodPerformValue(.isetFormula__formula(Parameter<String>.value(formula))) as? (String) -> Void
		perform?(formula)
    }

    func showLoading() {
        addInvocation(.ishowLoading)
		let perform = methodPerformValue(.ishowLoading) as? () -> Void
		perform?()
    }

    func showMosaicWithXem() {
        addInvocation(.ishowMosaicWithXem)
		let perform = methodPerformValue(.ishowMosaicWithXem) as? () -> Void
		perform?()
    }

    func hideMosaicWithXem() {
        addInvocation(.ihideMosaicWithXem)
		let perform = methodPerformValue(.ihideMosaicWithXem) as? () -> Void
		perform?()
    }

    func showMosaicOwned(_ mosaics: [MosaicDetail], selected: [MosaicDetail]) {
        addInvocation(.ishowMosaicOwned__mosaicsselected_selected(Parameter<[MosaicDetail]>.value(mosaics), Parameter<[MosaicDetail]>.value(selected)))
		let perform = methodPerformValue(.ishowMosaicOwned__mosaicsselected_selected(Parameter<[MosaicDetail]>.value(mosaics), Parameter<[MosaicDetail]>.value(selected))) as? ([MosaicDetail], [MosaicDetail]) -> Void
		perform?(mosaics, selected)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowAmount
        case ishowMosaic
        case ishowFirstAmountPage
        case isetAmounts__amounts(Parameter<[String]>)
        case isetFormula__formula(Parameter<String>)
        case ishowLoading
        case ishowMosaicWithXem
        case ihideMosaicWithXem
        case ishowMosaicOwned__mosaicsselected_selected(Parameter<[MosaicDetail]>, Parameter<[MosaicDetail]>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<SendAmountPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowAmount, .ishowAmount):
                    return true 
                case (.ishowMosaic, .ishowMosaic):
                    return true 
                case (.ishowFirstAmountPage, .ishowFirstAmountPage):
                    return true 
                case (.isetAmounts__amounts(let lhsAmounts), .isetAmounts__amounts(let rhsAmounts)):
                    guard Parameter.compare(lhs: lhsAmounts, rhs: rhsAmounts, with: matcher) else { return false } 
                    return true 
                case (.isetFormula__formula(let lhsFormula), .isetFormula__formula(let rhsFormula)):
                    guard Parameter.compare(lhs: lhsFormula, rhs: rhsFormula, with: matcher) else { return false } 
                    return true 
                case (.ishowLoading, .ishowLoading):
                    return true 
                case (.ishowMosaicWithXem, .ishowMosaicWithXem):
                    return true 
                case (.ihideMosaicWithXem, .ihideMosaicWithXem):
                    return true 
                case (.ishowMosaicOwned__mosaicsselected_selected(let lhsMosaics, let lhsSelected), .ishowMosaicOwned__mosaicsselected_selected(let rhsMosaics, let rhsSelected)):
                    guard Parameter.compare(lhs: lhsMosaics, rhs: rhsMosaics, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsSelected, rhs: rhsSelected, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SendAmountPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowAmount: return 0
                case .ishowMosaic: return 0
                case .ishowFirstAmountPage: return 0
                case let .isetAmounts__amounts(p0): return p0.intValue
                case let .isetFormula__formula(p0): return p0.intValue
                case .ishowLoading: return 0
                case .ishowMosaicWithXem: return 0
                case .ihideMosaicWithXem: return 0
                case let .ishowMosaicOwned__mosaicsselected_selected(p0, p1): return p0.intValue + p1.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showAmount() -> Verify {
            return Verify(method: .ishowAmount)
        }
        static func showMosaic() -> Verify {
            return Verify(method: .ishowMosaic)
        }
        static func showFirstAmountPage() -> Verify {
            return Verify(method: .ishowFirstAmountPage)
        }
        static func setAmounts(amounts: Parameter<[String]>) -> Verify {
            return Verify(method: .isetAmounts__amounts(amounts))
        }
        static func setFormula(formula: Parameter<String>) -> Verify {
            return Verify(method: .isetFormula__formula(formula))
        }
        static func showLoading() -> Verify {
            return Verify(method: .ishowLoading)
        }
        static func showMosaicWithXem() -> Verify {
            return Verify(method: .ishowMosaicWithXem)
        }
        static func hideMosaicWithXem() -> Verify {
            return Verify(method: .ihideMosaicWithXem)
        }
        static func showMosaicOwned(mosaics: Parameter<[MosaicDetail]>, selected: Parameter<[MosaicDetail]>) -> Verify {
            return Verify(method: .ishowMosaicOwned__mosaicsselected_selected(mosaics, selected))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showAmount(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowAmount, performs: perform)
        }
        static func showMosaic(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowMosaic, performs: perform)
        }
        static func showFirstAmountPage(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowFirstAmountPage, performs: perform)
        }
        static func setAmounts(amounts: Parameter<[String]>, perform: @escaping ([String]) -> Void) -> Perform {
            return Perform(method: .isetAmounts__amounts(amounts), performs: perform)
        }
        static func setFormula(formula: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .isetFormula__formula(formula), performs: perform)
        }
        static func showLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoading, performs: perform)
        }
        static func showMosaicWithXem(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowMosaicWithXem, performs: perform)
        }
        static func hideMosaicWithXem(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideMosaicWithXem, performs: perform)
        }
        static func showMosaicOwned(mosaics: Parameter<[MosaicDetail]>, selected: Parameter<[MosaicDetail]>, perform: @escaping ([MosaicDetail], [MosaicDetail]) -> Void) -> Perform {
            return Perform(method: .ishowMosaicOwned__mosaicsselected_selected(mosaics, selected), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendAmountWireframe
class SendAmountWireframeMock: SendAmountWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        addInvocation(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ sendTransaction: SendTransaction). Use given")
    }

    func presentSendMode(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendMode__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendMode__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__sendTransaction(Parameter<SendTransaction>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__sendTransaction(let lhsSendtransaction), .sassembleModule__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__sendTransaction(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__sendTransaction(sendTransaction), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(sendTransaction: Parameter<SendTransaction>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__sendTransaction(sendTransaction))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__sendTransaction(sendTransaction), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentSendMode__sendTransaction(Parameter<SendTransaction>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentSendMode__sendTransaction(let lhsSendtransaction), .ipresentSendMode__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentSendMode__sendTransaction(p0): return p0.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentSendMode(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendMode__sendTransaction(sendTransaction))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentSendMode(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendMode__sendTransaction(sendTransaction), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendConfirmationInteractorOutput
class SendConfirmationInteractorOutputMock: SendConfirmationInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func transactionSent(_ result: NemAnnounceResult) {
        addInvocation(.itransactionSent__result(Parameter<NemAnnounceResult>.value(result)))
		let perform = methodPerformValue(.itransactionSent__result(Parameter<NemAnnounceResult>.value(result))) as? (NemAnnounceResult) -> Void
		perform?(result)
    }

    func transactionSendFailed(_ error: Error) {
        addInvocation(.itransactionSendFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.itransactionSendFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case itransactionSent__result(Parameter<NemAnnounceResult>)
        case itransactionSendFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.itransactionSent__result(let lhsResult), .itransactionSent__result(let rhsResult)):
                    guard Parameter.compare(lhs: lhsResult, rhs: rhsResult, with: matcher) else { return false } 
                    return true 
                case (.itransactionSendFailed__error(let lhsError), .itransactionSendFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .itransactionSent__result(p0): return p0.intValue
                case let .itransactionSendFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func transactionSent(result: Parameter<NemAnnounceResult>) -> Verify {
            return Verify(method: .itransactionSent__result(result))
        }
        static func transactionSendFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .itransactionSendFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func transactionSent(result: Parameter<NemAnnounceResult>, perform: @escaping (NemAnnounceResult) -> Void) -> Perform {
            return Perform(method: .itransactionSent__result(result), performs: perform)
        }
        static func transactionSendFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .itransactionSendFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendConfirmationPresentation
class SendConfirmationPresentationMock: SendConfirmationPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SendConfirmationView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SendConfirmationView)?
    var interactor: SendConfirmationUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SendConfirmationPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SendConfirmationUseCase)?
    var router: SendConfirmationWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SendConfirmationPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SendConfirmationWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SendConfirmationView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SendConfirmationUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SendConfirmationWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickNeverRemind() {
        addInvocation(.ididClickNeverRemind)
		let perform = methodPerformValue(.ididClickNeverRemind) as? () -> Void
		perform?()
    }

    func didClickBottomPanel() {
        addInvocation(.ididClickBottomPanel)
		let perform = methodPerformValue(.ididClickBottomPanel) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    func didRegisterPin(_ pin: String) {
        addInvocation(.ididRegisterPin__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ididRegisterPin__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func didValidatePin(_ pin: String) {
        addInvocation(.ididValidatePin__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ididValidatePin__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func didCancelPin() {
        addInvocation(.ididCancelPin)
		let perform = methodPerformValue(.ididCancelPin) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickNeverRemind
        case ididClickBottomPanel
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case ididRegisterPin__pin(Parameter<String>)
        case ididValidatePin__pin(Parameter<String>)
        case ididCancelPin
        case view_get
		case view_set(Parameter<SendConfirmationView?>)
        case interactor_get
		case interactor_set(Parameter<SendConfirmationUseCase?>)
        case router_get
		case router_set(Parameter<SendConfirmationWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickNeverRemind, .ididClickNeverRemind):
                    return true 
                case (.ididClickBottomPanel, .ididClickBottomPanel):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.ididRegisterPin__pin(let lhsPin), .ididRegisterPin__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.ididValidatePin__pin(let lhsPin), .ididValidatePin__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.ididCancelPin, .ididCancelPin):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SendConfirmationView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SendConfirmationUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SendConfirmationWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickNeverRemind: return 0
                case .ididClickBottomPanel: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case let .ididRegisterPin__pin(p0): return p0.intValue
                case let .ididValidatePin__pin(p0): return p0.intValue
                case .ididCancelPin: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickNeverRemind() -> Verify {
            return Verify(method: .ididClickNeverRemind)
        }
        static func didClickBottomPanel() -> Verify {
            return Verify(method: .ididClickBottomPanel)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
        static func didRegisterPin(pin: Parameter<String>) -> Verify {
            return Verify(method: .ididRegisterPin__pin(pin))
        }
        static func didValidatePin(pin: Parameter<String>) -> Verify {
            return Verify(method: .ididValidatePin__pin(pin))
        }
        static func didCancelPin() -> Verify {
            return Verify(method: .ididCancelPin)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickNeverRemind(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickNeverRemind, performs: perform)
        }
        static func didClickBottomPanel(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickBottomPanel, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
        static func didRegisterPin(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididRegisterPin__pin(pin), performs: perform)
        }
        static func didValidatePin(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididValidatePin__pin(pin), performs: perform)
        }
        static func didCancelPin(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididCancelPin, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendConfirmationUseCase
class SendConfirmationUseCaseMock: SendConfirmationUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SendConfirmationInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SendConfirmationUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SendConfirmationInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SendConfirmationInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func sendTransaction(_ request: [UInt8], _ keyPair: KeyPair) {
        addInvocation(.isendTransaction__request_keyPair(Parameter<[UInt8]>.value(request), Parameter<KeyPair>.value(keyPair)))
		let perform = methodPerformValue(.isendTransaction__request_keyPair(Parameter<[UInt8]>.value(request), Parameter<KeyPair>.value(keyPair))) as? ([UInt8], KeyPair) -> Void
		perform?(request, keyPair)
    }

    fileprivate enum MethodType {
        case isendTransaction__request_keyPair(Parameter<[UInt8]>, Parameter<KeyPair>)
        case output_get
		case output_set(Parameter<SendConfirmationInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.isendTransaction__request_keyPair(let lhsRequest, let lhsKeypair), .isendTransaction__request_keyPair(let rhsRequest, let rhsKeypair)):
                    guard Parameter.compare(lhs: lhsRequest, rhs: rhsRequest, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsKeypair, rhs: rhsKeypair, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SendConfirmationInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .isendTransaction__request_keyPair(p0, p1): return p0.intValue + p1.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func sendTransaction(request: Parameter<[UInt8]>, keyPair: Parameter<KeyPair>) -> Verify {
            return Verify(method: .isendTransaction__request_keyPair(request, keyPair))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func sendTransaction(request: Parameter<[UInt8]>, keyPair: Parameter<KeyPair>, perform: @escaping ([UInt8], KeyPair) -> Void) -> Perform {
            return Perform(method: .isendTransaction__request_keyPair(request, keyPair), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendConfirmationView
class SendConfirmationViewMock: SendConfirmationView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SendConfirmationPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SendConfirmationViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SendConfirmationPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SendConfirmationPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showCaution() {
        addInvocation(.ishowCaution)
		let perform = methodPerformValue(.ishowCaution) as? () -> Void
		perform?()
    }

    func showAmounts(_ amounts: [String]) {
        addInvocation(.ishowAmounts__amounts(Parameter<[String]>.value(amounts)))
		let perform = methodPerformValue(.ishowAmounts__amounts(Parameter<[String]>.value(amounts))) as? ([String]) -> Void
		perform?(amounts)
    }

    func showFee(_ fee: String) {
        addInvocation(.ishowFee__fee(Parameter<String>.value(fee)))
		let perform = methodPerformValue(.ishowFee__fee(Parameter<String>.value(fee))) as? (String) -> Void
		perform?(fee)
    }

    func showDestination(_ destination: String) {
        addInvocation(.ishowDestination__destination(Parameter<String>.value(destination)))
		let perform = methodPerformValue(.ishowDestination__destination(Parameter<String>.value(destination))) as? (String) -> Void
		perform?(destination)
    }

    func showMessage(_ message: String) {
        addInvocation(.ishowMessage__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowMessage__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showLoading() {
        addInvocation(.ishowLoading)
		let perform = methodPerformValue(.ishowLoading) as? () -> Void
		perform?()
    }

    func hideLoading() {
        addInvocation(.ihideLoading)
		let perform = methodPerformValue(.ihideLoading) as? () -> Void
		perform?()
    }

    func showConfirmationMessage(_ icon: UIImage, _ message: String) {
        addInvocation(.ishowConfirmationMessage__icon_message(Parameter<UIImage>.value(icon), Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowConfirmationMessage__icon_message(Parameter<UIImage>.value(icon), Parameter<String>.value(message))) as? (UIImage, String) -> Void
		perform?(icon, message)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showPinDialog(presenter: PinDialogMixinPresentation) {
        addInvocation(.ishowPinDialog__presenter_presenter(Parameter<PinDialogMixinPresentation>.value(presenter)))
		let perform = methodPerformValue(.ishowPinDialog__presenter_presenter(Parameter<PinDialogMixinPresentation>.value(presenter))) as? (PinDialogMixinPresentation) -> Void
		perform?(presenter)
    }

    func showPinDialog(forRegistration: Bool, presenter: PinDialogMixinPresentation) {
        addInvocation(.ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<PinDialogMixinPresentation>.value(presenter)))
		let perform = methodPerformValue(.ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<PinDialogMixinPresentation>.value(presenter))) as? (Bool, PinDialogMixinPresentation) -> Void
		perform?(forRegistration, presenter)
    }

    func showPinDialog(forRegistration: Bool, cancelable: Bool, presenter: PinDialogMixinPresentation) {
        addInvocation(.ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<PinDialogMixinPresentation>.value(presenter)))
		let perform = methodPerformValue(.ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<PinDialogMixinPresentation>.value(presenter))) as? (Bool, Bool, PinDialogMixinPresentation) -> Void
		perform?(forRegistration, cancelable, presenter)
    }

    fileprivate enum MethodType {
        case ishowCaution
        case ishowAmounts__amounts(Parameter<[String]>)
        case ishowFee__fee(Parameter<String>)
        case ishowDestination__destination(Parameter<String>)
        case ishowMessage__message(Parameter<String>)
        case ishowLoading
        case ihideLoading
        case ishowConfirmationMessage__icon_message(Parameter<UIImage>, Parameter<String>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case ishowPinDialog__presenter_presenter(Parameter<PinDialogMixinPresentation>)
        case ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(Parameter<Bool>, Parameter<PinDialogMixinPresentation>)
        case ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(Parameter<Bool>, Parameter<Bool>, Parameter<PinDialogMixinPresentation>)
        case presenter_get
		case presenter_set(Parameter<SendConfirmationPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowCaution, .ishowCaution):
                    return true 
                case (.ishowAmounts__amounts(let lhsAmounts), .ishowAmounts__amounts(let rhsAmounts)):
                    guard Parameter.compare(lhs: lhsAmounts, rhs: rhsAmounts, with: matcher) else { return false } 
                    return true 
                case (.ishowFee__fee(let lhsFee), .ishowFee__fee(let rhsFee)):
                    guard Parameter.compare(lhs: lhsFee, rhs: rhsFee, with: matcher) else { return false } 
                    return true 
                case (.ishowDestination__destination(let lhsDestination), .ishowDestination__destination(let rhsDestination)):
                    guard Parameter.compare(lhs: lhsDestination, rhs: rhsDestination, with: matcher) else { return false } 
                    return true 
                case (.ishowMessage__message(let lhsMessage), .ishowMessage__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowLoading, .ishowLoading):
                    return true 
                case (.ihideLoading, .ihideLoading):
                    return true 
                case (.ishowConfirmationMessage__icon_message(let lhsIcon, let lhsMessage), .ishowConfirmationMessage__icon_message(let rhsIcon, let rhsMessage)):
                    guard Parameter.compare(lhs: lhsIcon, rhs: rhsIcon, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowPinDialog__presenter_presenter(let lhsPresenter), .ishowPinDialog__presenter_presenter(let rhsPresenter)):
                    guard Parameter.compare(lhs: lhsPresenter, rhs: rhsPresenter, with: matcher) else { return false } 
                    return true 
                case (.ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(let lhsForregistration, let lhsPresenter), .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(let rhsForregistration, let rhsPresenter)):
                    guard Parameter.compare(lhs: lhsForregistration, rhs: rhsForregistration, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsPresenter, rhs: rhsPresenter, with: matcher) else { return false } 
                    return true 
                case (.ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(let lhsForregistration, let lhsCancelable, let lhsPresenter), .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(let rhsForregistration, let rhsCancelable, let rhsPresenter)):
                    guard Parameter.compare(lhs: lhsForregistration, rhs: rhsForregistration, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsCancelable, rhs: rhsCancelable, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsPresenter, rhs: rhsPresenter, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SendConfirmationPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowCaution: return 0
                case let .ishowAmounts__amounts(p0): return p0.intValue
                case let .ishowFee__fee(p0): return p0.intValue
                case let .ishowDestination__destination(p0): return p0.intValue
                case let .ishowMessage__message(p0): return p0.intValue
                case .ishowLoading: return 0
                case .ihideLoading: return 0
                case let .ishowConfirmationMessage__icon_message(p0, p1): return p0.intValue + p1.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case let .ishowPinDialog__presenter_presenter(p0): return p0.intValue
                case let .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(p0, p1): return p0.intValue + p1.intValue
                case let .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showCaution() -> Verify {
            return Verify(method: .ishowCaution)
        }
        static func showAmounts(amounts: Parameter<[String]>) -> Verify {
            return Verify(method: .ishowAmounts__amounts(amounts))
        }
        static func showFee(fee: Parameter<String>) -> Verify {
            return Verify(method: .ishowFee__fee(fee))
        }
        static func showDestination(destination: Parameter<String>) -> Verify {
            return Verify(method: .ishowDestination__destination(destination))
        }
        static func showMessage(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowMessage__message(message))
        }
        static func showLoading() -> Verify {
            return Verify(method: .ishowLoading)
        }
        static func hideLoading() -> Verify {
            return Verify(method: .ihideLoading)
        }
        static func showConfirmationMessage(icon: Parameter<UIImage>, message: Parameter<String>) -> Verify {
            return Verify(method: .ishowConfirmationMessage__icon_message(icon, message))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
        static func showPinDialog(presenter: Parameter<PinDialogMixinPresentation>) -> Verify {
            return Verify(method: .ishowPinDialog__presenter_presenter(presenter))
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>) -> Verify {
            return Verify(method: .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(forRegistration, presenter))
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>) -> Verify {
            return Verify(method: .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(forRegistration, cancelable, presenter))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showCaution(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowCaution, performs: perform)
        }
        static func showAmounts(amounts: Parameter<[String]>, perform: @escaping ([String]) -> Void) -> Perform {
            return Perform(method: .ishowAmounts__amounts(amounts), performs: perform)
        }
        static func showFee(fee: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowFee__fee(fee), performs: perform)
        }
        static func showDestination(destination: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowDestination__destination(destination), performs: perform)
        }
        static func showMessage(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowMessage__message(message), performs: perform)
        }
        static func showLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoading, performs: perform)
        }
        static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideLoading, performs: perform)
        }
        static func showConfirmationMessage(icon: Parameter<UIImage>, message: Parameter<String>, perform: @escaping (UIImage, String) -> Void) -> Perform {
            return Perform(method: .ishowConfirmationMessage__icon_message(icon, message), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
        static func showPinDialog(presenter: Parameter<PinDialogMixinPresentation>, perform: @escaping (PinDialogMixinPresentation) -> Void) -> Perform {
            return Perform(method: .ishowPinDialog__presenter_presenter(presenter), performs: perform)
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>, perform: @escaping (Bool, PinDialogMixinPresentation) -> Void) -> Perform {
            return Perform(method: .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(forRegistration, presenter), performs: perform)
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>, perform: @escaping (Bool, Bool, PinDialogMixinPresentation) -> Void) -> Perform {
            return Perform(method: .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(forRegistration, cancelable, presenter), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendConfirmationWireframe
class SendConfirmationWireframeMock: SendConfirmationWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        addInvocation(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ sendTransaction: SendTransaction). Use given")
    }

    func presentSendEnd() {
        addInvocation(.ipresentSendEnd)
		let perform = methodPerformValue(.ipresentSendEnd) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__sendTransaction(Parameter<SendTransaction>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__sendTransaction(let lhsSendtransaction), .sassembleModule__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__sendTransaction(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__sendTransaction(sendTransaction), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(sendTransaction: Parameter<SendTransaction>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__sendTransaction(sendTransaction))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__sendTransaction(sendTransaction), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentSendEnd
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentSendEnd, .ipresentSendEnd):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ipresentSendEnd: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentSendEnd() -> Verify {
            return Verify(method: .ipresentSendEnd)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentSendEnd(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentSendEnd, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendEndInteractorOutput
class SendEndInteractorOutputMock: SendEndInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendEndPresentation
class SendEndPresentationMock: SendEndPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SendEndView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SendEndView)?
    var interactor: SendEndUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SendEndPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SendEndUseCase)?
    var router: SendEndWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SendEndPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SendEndWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SendEndView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SendEndUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SendEndWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickHome() {
        addInvocation(.ididClickHome)
		let perform = methodPerformValue(.ididClickHome) as? () -> Void
		perform?()
    }

    func didClickTransaction() {
        addInvocation(.ididClickTransaction)
		let perform = methodPerformValue(.ididClickTransaction) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickHome
        case ididClickTransaction
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<SendEndView?>)
        case interactor_get
		case interactor_set(Parameter<SendEndUseCase?>)
        case router_get
		case router_set(Parameter<SendEndWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickHome, .ididClickHome):
                    return true 
                case (.ididClickTransaction, .ididClickTransaction):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SendEndView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SendEndUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SendEndWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickHome: return 0
                case .ididClickTransaction: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickHome() -> Verify {
            return Verify(method: .ididClickHome)
        }
        static func didClickTransaction() -> Verify {
            return Verify(method: .ididClickTransaction)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickHome(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickHome, performs: perform)
        }
        static func didClickTransaction(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickTransaction, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendEndUseCase
class SendEndUseCaseMock: SendEndUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SendEndInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SendEndUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SendEndInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SendEndInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<SendEndInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SendEndInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendEndView
class SendEndViewMock: SendEndView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SendEndPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SendEndViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SendEndPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SendEndPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<SendEndPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SendEndPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendEndWireframe
class SendEndWireframeMock: SendEndWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func goBackHome() {
        addInvocation(.igoBackHome)
		let perform = methodPerformValue(.igoBackHome) as? () -> Void
		perform?()
    }

    func presentTransaction() {
        addInvocation(.ipresentTransaction)
		let perform = methodPerformValue(.ipresentTransaction) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case igoBackHome
        case ipresentTransaction
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.igoBackHome, .igoBackHome):
                    return true 
                case (.ipresentTransaction, .ipresentTransaction):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .igoBackHome: return 0
                case .ipresentTransaction: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func goBackHome() -> Verify {
            return Verify(method: .igoBackHome)
        }
        static func presentTransaction() -> Verify {
            return Verify(method: .ipresentTransaction)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func goBackHome(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .igoBackHome, performs: perform)
        }
        static func presentTransaction(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentTransaction, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageInteractorOutput
class SendMessageInteractorOutputMock: SendMessageInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessagePresentation
class SendMessagePresentationMock: SendMessagePresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SendMessageView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SendMessageView)?
    var interactor: SendMessageUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SendMessagePresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SendMessageUseCase)?
    var router: SendMessageWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SendMessagePresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SendMessageWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SendMessageView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SendMessageUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SendMessageWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickOk() {
        addInvocation(.ididClickOk)
		let perform = methodPerformValue(.ididClickOk) as? () -> Void
		perform?()
    }

    func didClickCancel() {
        addInvocation(.ididClickCancel)
		let perform = methodPerformValue(.ididClickCancel) as? () -> Void
		perform?()
    }

    func didChangeMessage(_ message: String) {
        addInvocation(.ididChangeMessage__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ididChangeMessage__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickOk
        case ididClickCancel
        case ididChangeMessage__message(Parameter<String>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<SendMessageView?>)
        case interactor_get
		case interactor_set(Parameter<SendMessageUseCase?>)
        case router_get
		case router_set(Parameter<SendMessageWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickOk, .ididClickOk):
                    return true 
                case (.ididClickCancel, .ididClickCancel):
                    return true 
                case (.ididChangeMessage__message(let lhsMessage), .ididChangeMessage__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SendMessageView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SendMessageUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SendMessageWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickOk: return 0
                case .ididClickCancel: return 0
                case let .ididChangeMessage__message(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickOk() -> Verify {
            return Verify(method: .ididClickOk)
        }
        static func didClickCancel() -> Verify {
            return Verify(method: .ididClickCancel)
        }
        static func didChangeMessage(message: Parameter<String>) -> Verify {
            return Verify(method: .ididChangeMessage__message(message))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickOk(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickOk, performs: perform)
        }
        static func didClickCancel(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickCancel, performs: perform)
        }
        static func didChangeMessage(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididChangeMessage__message(message), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageTypeInteractorOutput
class SendMessageTypeInteractorOutputMock: SendMessageTypeInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageTypePresentation
class SendMessageTypePresentationMock: SendMessageTypePresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SendMessageTypeView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SendMessageTypeView)?
    var interactor: SendMessageTypeUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SendMessageTypePresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SendMessageTypeUseCase)?
    var router: SendMessageTypeWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SendMessageTypePresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SendMessageTypeWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SendMessageTypeView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SendMessageTypeUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SendMessageTypeWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickStandard() {
        addInvocation(.ididClickStandard)
		let perform = methodPerformValue(.ididClickStandard) as? () -> Void
		perform?()
    }

    func didClickEncryption() {
        addInvocation(.ididClickEncryption)
		let perform = methodPerformValue(.ididClickEncryption) as? () -> Void
		perform?()
    }

    func didConfirmMessage(_ message: String) {
        addInvocation(.ididConfirmMessage__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ididConfirmMessage__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickStandard
        case ididClickEncryption
        case ididConfirmMessage__message(Parameter<String>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<SendMessageTypeView?>)
        case interactor_get
		case interactor_set(Parameter<SendMessageTypeUseCase?>)
        case router_get
		case router_set(Parameter<SendMessageTypeWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickStandard, .ididClickStandard):
                    return true 
                case (.ididClickEncryption, .ididClickEncryption):
                    return true 
                case (.ididConfirmMessage__message(let lhsMessage), .ididConfirmMessage__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SendMessageTypeView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SendMessageTypeUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SendMessageTypeWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickStandard: return 0
                case .ididClickEncryption: return 0
                case let .ididConfirmMessage__message(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickStandard() -> Verify {
            return Verify(method: .ididClickStandard)
        }
        static func didClickEncryption() -> Verify {
            return Verify(method: .ididClickEncryption)
        }
        static func didConfirmMessage(message: Parameter<String>) -> Verify {
            return Verify(method: .ididConfirmMessage__message(message))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickStandard(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickStandard, performs: perform)
        }
        static func didClickEncryption(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickEncryption, performs: perform)
        }
        static func didConfirmMessage(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididConfirmMessage__message(message), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageTypeUseCase
class SendMessageTypeUseCaseMock: SendMessageTypeUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SendMessageTypeInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SendMessageTypeUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SendMessageTypeInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SendMessageTypeInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<SendMessageTypeInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SendMessageTypeInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageTypeView
class SendMessageTypeViewMock: SendMessageTypeView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SendMessageTypePresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SendMessageTypeViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SendMessageTypePresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SendMessageTypePresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showMessageInputDialog() {
        addInvocation(.ishowMessageInputDialog)
		let perform = methodPerformValue(.ishowMessageInputDialog) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowMessageInputDialog
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<SendMessageTypePresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowMessageInputDialog, .ishowMessageInputDialog):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SendMessageTypePresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowMessageInputDialog: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showMessageInputDialog() -> Verify {
            return Verify(method: .ishowMessageInputDialog)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showMessageInputDialog(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowMessageInputDialog, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageTypeWireframe
class SendMessageTypeWireframeMock: SendMessageTypeWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        addInvocation(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ sendTransaction: SendTransaction). Use given")
    }

    func presentSendConfirmation(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__sendTransaction(Parameter<SendTransaction>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__sendTransaction(let lhsSendtransaction), .sassembleModule__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__sendTransaction(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__sendTransaction(sendTransaction), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(sendTransaction: Parameter<SendTransaction>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__sendTransaction(sendTransaction))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__sendTransaction(sendTransaction), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentSendConfirmation__sendTransaction(let lhsSendtransaction), .ipresentSendConfirmation__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentSendConfirmation__sendTransaction(p0): return p0.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentSendConfirmation(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendConfirmation__sendTransaction(sendTransaction))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentSendConfirmation(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendConfirmation__sendTransaction(sendTransaction), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageUseCase
class SendMessageUseCaseMock: SendMessageUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SendMessageInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SendMessageUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SendMessageInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SendMessageInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<SendMessageInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SendMessageInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageView
class SendMessageViewMock: SendMessageView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SendMessagePresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SendMessageViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SendMessagePresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SendMessagePresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func enableOk() {
        addInvocation(.ienableOk)
		let perform = methodPerformValue(.ienableOk) as? () -> Void
		perform?()
    }

    func disableOk() {
        addInvocation(.idisableOk)
		let perform = methodPerformValue(.idisableOk) as? () -> Void
		perform?()
    }

    func showTitle(_ title: String) {
        addInvocation(.ishowTitle__title(Parameter<String>.value(title)))
		let perform = methodPerformValue(.ishowTitle__title(Parameter<String>.value(title))) as? (String) -> Void
		perform?(title)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ienableOk
        case idisableOk
        case ishowTitle__title(Parameter<String>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<SendMessagePresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ienableOk, .ienableOk):
                    return true 
                case (.idisableOk, .idisableOk):
                    return true 
                case (.ishowTitle__title(let lhsTitle), .ishowTitle__title(let rhsTitle)):
                    guard Parameter.compare(lhs: lhsTitle, rhs: rhsTitle, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SendMessagePresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ienableOk: return 0
                case .idisableOk: return 0
                case let .ishowTitle__title(p0): return p0.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func enableOk() -> Verify {
            return Verify(method: .ienableOk)
        }
        static func disableOk() -> Verify {
            return Verify(method: .idisableOk)
        }
        static func showTitle(title: Parameter<String>) -> Verify {
            return Verify(method: .ishowTitle__title(title))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func enableOk(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ienableOk, performs: perform)
        }
        static func disableOk(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .idisableOk, performs: perform)
        }
        static func showTitle(title: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowTitle__title(title), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendMessageWireframe
class SendMessageWireframeMock: SendMessageWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ handler: ((String?) -> Void)?) -> UIViewController {
        addInvocation(.sassembleModule__handler(Parameter<((String?) -> Void)?>.value(handler)))
		let perform = methodPerformValue(.sassembleModule__handler(Parameter<((String?) -> Void)?>.value(handler))) as? (((String?) -> Void)?) -> Void
		perform?(handler)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__handler(Parameter<((String?) -> Void)?>.value(handler)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ handler: ((String?) -> Void)?). Use given")
    }

    func dismiss(_ message: String?, _ handler: ((String?) -> Void)?) {
        addInvocation(.idismiss__message_handler(Parameter<String?>.value(message), Parameter<((String?) -> Void)?>.value(handler)))
		let perform = methodPerformValue(.idismiss__message_handler(Parameter<String?>.value(message), Parameter<((String?) -> Void)?>.value(handler))) as? (String?, ((String?) -> Void)?) -> Void
		perform?(message, handler)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__handler(Parameter<((String?) -> Void)?>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__handler(let lhsHandler), .sassembleModule__handler(let rhsHandler)):
                    guard Parameter.compare(lhs: lhsHandler, rhs: rhsHandler, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__handler(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(handler: Parameter<((String?) -> Void)?>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__handler(handler), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(handler: Parameter<((String?) -> Void)?>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__handler(handler))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(handler: Parameter<((String?) -> Void)?>, perform: @escaping (((String?) -> Void)?) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__handler(handler), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case idismiss__message_handler(Parameter<String?>, Parameter<((String?) -> Void)?>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.idismiss__message_handler(let lhsMessage, let lhsHandler), .idismiss__message_handler(let rhsMessage, let rhsHandler)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsHandler, rhs: rhsHandler, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .idismiss__message_handler(p0, p1): return p0.intValue + p1.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func dismiss(message: Parameter<String?>, handler: Parameter<((String?) -> Void)?>) -> Verify {
            return Verify(method: .idismiss__message_handler(message, handler))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func dismiss(message: Parameter<String?>, handler: Parameter<((String?) -> Void)?>, perform: @escaping (String?, ((String?) -> Void)?) -> Void) -> Perform {
            return Perform(method: .idismiss__message_handler(message, handler), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendModeInteractorOutput
class SendModeInteractorOutputMock: SendModeInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendModePresentation
class SendModePresentationMock: SendModePresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SendModeView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SendModeView)?
    var interactor: SendModeUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SendModePresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SendModeUseCase)?
    var router: SendModeWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SendModePresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SendModeWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SendModeView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SendModeUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SendModeWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickStandard() {
        addInvocation(.ididClickStandard)
		let perform = methodPerformValue(.ididClickStandard) as? () -> Void
		perform?()
    }

    func didClickMessage() {
        addInvocation(.ididClickMessage)
		let perform = methodPerformValue(.ididClickMessage) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickStandard
        case ididClickMessage
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<SendModeView?>)
        case interactor_get
		case interactor_set(Parameter<SendModeUseCase?>)
        case router_get
		case router_set(Parameter<SendModeWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickStandard, .ididClickStandard):
                    return true 
                case (.ididClickMessage, .ididClickMessage):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SendModeView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SendModeUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SendModeWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickStandard: return 0
                case .ididClickMessage: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickStandard() -> Verify {
            return Verify(method: .ididClickStandard)
        }
        static func didClickMessage() -> Verify {
            return Verify(method: .ididClickMessage)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickStandard(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickStandard, performs: perform)
        }
        static func didClickMessage(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickMessage, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendModeUseCase
class SendModeUseCaseMock: SendModeUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SendModeInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SendModeUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SendModeInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SendModeInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<SendModeInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SendModeInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendModeView
class SendModeViewMock: SendModeView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SendModePresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SendModeViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SendModePresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SendModePresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<SendModePresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SendModePresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SendModeWireframe
class SendModeWireframeMock: SendModeWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        addInvocation(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ sendTransaction: SendTransaction). Use given")
    }

    func presentSendConfirmation(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    func presentSendMessageType(_ sendTransaction: SendTransaction) {
        addInvocation(.ipresentSendMessageType__sendTransaction(Parameter<SendTransaction>.value(sendTransaction)))
		let perform = methodPerformValue(.ipresentSendMessageType__sendTransaction(Parameter<SendTransaction>.value(sendTransaction))) as? (SendTransaction) -> Void
		perform?(sendTransaction)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__sendTransaction(Parameter<SendTransaction>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__sendTransaction(let lhsSendtransaction), .sassembleModule__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__sendTransaction(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__sendTransaction(sendTransaction), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(sendTransaction: Parameter<SendTransaction>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__sendTransaction(sendTransaction))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__sendTransaction(sendTransaction), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentSendConfirmation__sendTransaction(Parameter<SendTransaction>)
        case ipresentSendMessageType__sendTransaction(Parameter<SendTransaction>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentSendConfirmation__sendTransaction(let lhsSendtransaction), .ipresentSendConfirmation__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.ipresentSendMessageType__sendTransaction(let lhsSendtransaction), .ipresentSendMessageType__sendTransaction(let rhsSendtransaction)):
                    guard Parameter.compare(lhs: lhsSendtransaction, rhs: rhsSendtransaction, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentSendConfirmation__sendTransaction(p0): return p0.intValue
                case let .ipresentSendMessageType__sendTransaction(p0): return p0.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentSendConfirmation(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendConfirmation__sendTransaction(sendTransaction))
        }
        static func presentSendMessageType(sendTransaction: Parameter<SendTransaction>) -> Verify {
            return Verify(method: .ipresentSendMessageType__sendTransaction(sendTransaction))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentSendConfirmation(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendConfirmation__sendTransaction(sendTransaction), performs: perform)
        }
        static func presentSendMessageType(sendTransaction: Parameter<SendTransaction>, perform: @escaping (SendTransaction) -> Void) -> Perform {
            return Perform(method: .ipresentSendMessageType__sendTransaction(sendTransaction), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SettingTopInteractorOutput
class SettingTopInteractorOutputMock: SettingTopInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never



    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SettingTopPresentation
class SettingTopPresentationMock: SettingTopPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: SettingTopView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (SettingTopView)?
    var interactor: SettingTopUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("SettingTopPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (SettingTopUseCase)?
    var router: SettingTopWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("SettingTopPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (SettingTopWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<SettingTopView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<SettingTopUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<SettingTopWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickNodeSelect() {
        addInvocation(.ididClickNodeSelect)
		let perform = methodPerformValue(.ididClickNodeSelect) as? () -> Void
		perform?()
    }

    func didClickLanguageSelect() {
        addInvocation(.ididClickLanguageSelect)
		let perform = methodPerformValue(.ididClickLanguageSelect) as? () -> Void
		perform?()
    }

    func didClickNotificationSetting() {
        addInvocation(.ididClickNotificationSetting)
		let perform = methodPerformValue(.ididClickNotificationSetting) as? () -> Void
		perform?()
    }

    func didClickChangePassword() {
        addInvocation(.ididClickChangePassword)
		let perform = methodPerformValue(.ididClickChangePassword) as? () -> Void
		perform?()
    }

    func didRegisterPin(_ pin: String) {
        addInvocation(.ididRegisterPin__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ididRegisterPin__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func didChangeIsBiometricsRequired(_ isBiometricsRequired: Bool) {
        addInvocation(.ididChangeIsBiometricsRequired__isBiometricsRequired(Parameter<Bool>.value(isBiometricsRequired)))
		let perform = methodPerformValue(.ididChangeIsBiometricsRequired__isBiometricsRequired(Parameter<Bool>.value(isBiometricsRequired))) as? (Bool) -> Void
		perform?(isBiometricsRequired)
    }

    func didValidatePinForBiometrics(_ pin: String) {
        addInvocation(.ididValidatePinForBiometrics__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ididValidatePinForBiometrics__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func didClickEnableBiometrics() {
        addInvocation(.ididClickEnableBiometrics)
		let perform = methodPerformValue(.ididClickEnableBiometrics) as? () -> Void
		perform?()
    }

    func didClickCancelBiometrics() {
        addInvocation(.ididClickCancelBiometrics)
		let perform = methodPerformValue(.ididClickCancelBiometrics) as? () -> Void
		perform?()
    }

    func didChangeIsPinRequiredOnLaunch(_ isPinRequiredOnLaunch: Bool) {
        addInvocation(.ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(Parameter<Bool>.value(isPinRequiredOnLaunch)))
		let perform = methodPerformValue(.ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(Parameter<Bool>.value(isPinRequiredOnLaunch))) as? (Bool) -> Void
		perform?(isPinRequiredOnLaunch)
    }

    func didClickGoToSecurityLesson() {
        addInvocation(.ididClickGoToSecurityLesson)
		let perform = methodPerformValue(.ididClickGoToSecurityLesson) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickNodeSelect
        case ididClickLanguageSelect
        case ididClickNotificationSetting
        case ididClickChangePassword
        case ididRegisterPin__pin(Parameter<String>)
        case ididChangeIsBiometricsRequired__isBiometricsRequired(Parameter<Bool>)
        case ididValidatePinForBiometrics__pin(Parameter<String>)
        case ididClickEnableBiometrics
        case ididClickCancelBiometrics
        case ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(Parameter<Bool>)
        case ididClickGoToSecurityLesson
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<SettingTopView?>)
        case interactor_get
		case interactor_set(Parameter<SettingTopUseCase?>)
        case router_get
		case router_set(Parameter<SettingTopWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickNodeSelect, .ididClickNodeSelect):
                    return true 
                case (.ididClickLanguageSelect, .ididClickLanguageSelect):
                    return true 
                case (.ididClickNotificationSetting, .ididClickNotificationSetting):
                    return true 
                case (.ididClickChangePassword, .ididClickChangePassword):
                    return true 
                case (.ididRegisterPin__pin(let lhsPin), .ididRegisterPin__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.ididChangeIsBiometricsRequired__isBiometricsRequired(let lhsIsbiometricsrequired), .ididChangeIsBiometricsRequired__isBiometricsRequired(let rhsIsbiometricsrequired)):
                    guard Parameter.compare(lhs: lhsIsbiometricsrequired, rhs: rhsIsbiometricsrequired, with: matcher) else { return false } 
                    return true 
                case (.ididValidatePinForBiometrics__pin(let lhsPin), .ididValidatePinForBiometrics__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.ididClickEnableBiometrics, .ididClickEnableBiometrics):
                    return true 
                case (.ididClickCancelBiometrics, .ididClickCancelBiometrics):
                    return true 
                case (.ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(let lhsIspinrequiredonlaunch), .ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(let rhsIspinrequiredonlaunch)):
                    guard Parameter.compare(lhs: lhsIspinrequiredonlaunch, rhs: rhsIspinrequiredonlaunch, with: matcher) else { return false } 
                    return true 
                case (.ididClickGoToSecurityLesson, .ididClickGoToSecurityLesson):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<SettingTopView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<SettingTopUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<SettingTopWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickNodeSelect: return 0
                case .ididClickLanguageSelect: return 0
                case .ididClickNotificationSetting: return 0
                case .ididClickChangePassword: return 0
                case let .ididRegisterPin__pin(p0): return p0.intValue
                case let .ididChangeIsBiometricsRequired__isBiometricsRequired(p0): return p0.intValue
                case let .ididValidatePinForBiometrics__pin(p0): return p0.intValue
                case .ididClickEnableBiometrics: return 0
                case .ididClickCancelBiometrics: return 0
                case let .ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(p0): return p0.intValue
                case .ididClickGoToSecurityLesson: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickNodeSelect() -> Verify {
            return Verify(method: .ididClickNodeSelect)
        }
        static func didClickLanguageSelect() -> Verify {
            return Verify(method: .ididClickLanguageSelect)
        }
        static func didClickNotificationSetting() -> Verify {
            return Verify(method: .ididClickNotificationSetting)
        }
        static func didClickChangePassword() -> Verify {
            return Verify(method: .ididClickChangePassword)
        }
        static func didRegisterPin(pin: Parameter<String>) -> Verify {
            return Verify(method: .ididRegisterPin__pin(pin))
        }
        static func didChangeIsBiometricsRequired(isBiometricsRequired: Parameter<Bool>) -> Verify {
            return Verify(method: .ididChangeIsBiometricsRequired__isBiometricsRequired(isBiometricsRequired))
        }
        static func didValidatePinForBiometrics(pin: Parameter<String>) -> Verify {
            return Verify(method: .ididValidatePinForBiometrics__pin(pin))
        }
        static func didClickEnableBiometrics() -> Verify {
            return Verify(method: .ididClickEnableBiometrics)
        }
        static func didClickCancelBiometrics() -> Verify {
            return Verify(method: .ididClickCancelBiometrics)
        }
        static func didChangeIsPinRequiredOnLaunch(isPinRequiredOnLaunch: Parameter<Bool>) -> Verify {
            return Verify(method: .ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(isPinRequiredOnLaunch))
        }
        static func didClickGoToSecurityLesson() -> Verify {
            return Verify(method: .ididClickGoToSecurityLesson)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickNodeSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickNodeSelect, performs: perform)
        }
        static func didClickLanguageSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickLanguageSelect, performs: perform)
        }
        static func didClickNotificationSetting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickNotificationSetting, performs: perform)
        }
        static func didClickChangePassword(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickChangePassword, performs: perform)
        }
        static func didRegisterPin(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididRegisterPin__pin(pin), performs: perform)
        }
        static func didChangeIsBiometricsRequired(isBiometricsRequired: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ididChangeIsBiometricsRequired__isBiometricsRequired(isBiometricsRequired), performs: perform)
        }
        static func didValidatePinForBiometrics(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididValidatePinForBiometrics__pin(pin), performs: perform)
        }
        static func didClickEnableBiometrics(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickEnableBiometrics, performs: perform)
        }
        static func didClickCancelBiometrics(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickCancelBiometrics, performs: perform)
        }
        static func didChangeIsPinRequiredOnLaunch(isPinRequiredOnLaunch: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ididChangeIsPinRequiredOnLaunch__isPinRequiredOnLaunch(isPinRequiredOnLaunch), performs: perform)
        }
        static func didClickGoToSecurityLesson(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickGoToSecurityLesson, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SettingTopUseCase
class SettingTopUseCaseMock: SettingTopUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: SettingTopInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("SettingTopUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (SettingTopInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<SettingTopInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    fileprivate enum MethodType {
        case output_get
		case output_set(Parameter<SettingTopInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<SettingTopInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SettingTopView
class SettingTopViewMock: SettingTopView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: SettingTopPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("SettingTopViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (SettingTopPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<SettingTopPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showPinDialogForRegistration() {
        addInvocation(.ishowPinDialogForRegistration)
		let perform = methodPerformValue(.ishowPinDialogForRegistration) as? () -> Void
		perform?()
    }

    func showPinDialogForBiometrics() {
        addInvocation(.ishowPinDialogForBiometrics)
		let perform = methodPerformValue(.ishowPinDialogForBiometrics) as? () -> Void
		perform?()
    }

    func showBiometricsEnableDialog() {
        addInvocation(.ishowBiometricsEnableDialog)
		let perform = methodPerformValue(.ishowBiometricsEnableDialog) as? () -> Void
		perform?()
    }

    func showBiometricsSuccessDialog() {
        addInvocation(.ishowBiometricsSuccessDialog)
		let perform = methodPerformValue(.ishowBiometricsSuccessDialog) as? () -> Void
		perform?()
    }

    func showIsBiometricsRequired(_ isBiometricsRequired: Bool) {
        addInvocation(.ishowIsBiometricsRequired__isBiometricsRequired(Parameter<Bool>.value(isBiometricsRequired)))
		let perform = methodPerformValue(.ishowIsBiometricsRequired__isBiometricsRequired(Parameter<Bool>.value(isBiometricsRequired))) as? (Bool) -> Void
		perform?(isBiometricsRequired)
    }

    func showIsPinRequiredOnLaunch(_ isPinRequiredOnLaunch: Bool) {
        addInvocation(.ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(Parameter<Bool>.value(isPinRequiredOnLaunch)))
		let perform = methodPerformValue(.ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(Parameter<Bool>.value(isPinRequiredOnLaunch))) as? (Bool) -> Void
		perform?(isPinRequiredOnLaunch)
    }

    func showPinNotAvailableDialog() {
        addInvocation(.ishowPinNotAvailableDialog)
		let perform = methodPerformValue(.ishowPinNotAvailableDialog) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowPinDialogForRegistration
        case ishowPinDialogForBiometrics
        case ishowBiometricsEnableDialog
        case ishowBiometricsSuccessDialog
        case ishowIsBiometricsRequired__isBiometricsRequired(Parameter<Bool>)
        case ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(Parameter<Bool>)
        case ishowPinNotAvailableDialog
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<SettingTopPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowPinDialogForRegistration, .ishowPinDialogForRegistration):
                    return true 
                case (.ishowPinDialogForBiometrics, .ishowPinDialogForBiometrics):
                    return true 
                case (.ishowBiometricsEnableDialog, .ishowBiometricsEnableDialog):
                    return true 
                case (.ishowBiometricsSuccessDialog, .ishowBiometricsSuccessDialog):
                    return true 
                case (.ishowIsBiometricsRequired__isBiometricsRequired(let lhsIsbiometricsrequired), .ishowIsBiometricsRequired__isBiometricsRequired(let rhsIsbiometricsrequired)):
                    guard Parameter.compare(lhs: lhsIsbiometricsrequired, rhs: rhsIsbiometricsrequired, with: matcher) else { return false } 
                    return true 
                case (.ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(let lhsIspinrequiredonlaunch), .ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(let rhsIspinrequiredonlaunch)):
                    guard Parameter.compare(lhs: lhsIspinrequiredonlaunch, rhs: rhsIspinrequiredonlaunch, with: matcher) else { return false } 
                    return true 
                case (.ishowPinNotAvailableDialog, .ishowPinNotAvailableDialog):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<SettingTopPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowPinDialogForRegistration: return 0
                case .ishowPinDialogForBiometrics: return 0
                case .ishowBiometricsEnableDialog: return 0
                case .ishowBiometricsSuccessDialog: return 0
                case let .ishowIsBiometricsRequired__isBiometricsRequired(p0): return p0.intValue
                case let .ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(p0): return p0.intValue
                case .ishowPinNotAvailableDialog: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showPinDialogForRegistration() -> Verify {
            return Verify(method: .ishowPinDialogForRegistration)
        }
        static func showPinDialogForBiometrics() -> Verify {
            return Verify(method: .ishowPinDialogForBiometrics)
        }
        static func showBiometricsEnableDialog() -> Verify {
            return Verify(method: .ishowBiometricsEnableDialog)
        }
        static func showBiometricsSuccessDialog() -> Verify {
            return Verify(method: .ishowBiometricsSuccessDialog)
        }
        static func showIsBiometricsRequired(isBiometricsRequired: Parameter<Bool>) -> Verify {
            return Verify(method: .ishowIsBiometricsRequired__isBiometricsRequired(isBiometricsRequired))
        }
        static func showIsPinRequiredOnLaunch(isPinRequiredOnLaunch: Parameter<Bool>) -> Verify {
            return Verify(method: .ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(isPinRequiredOnLaunch))
        }
        static func showPinNotAvailableDialog() -> Verify {
            return Verify(method: .ishowPinNotAvailableDialog)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showPinDialogForRegistration(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowPinDialogForRegistration, performs: perform)
        }
        static func showPinDialogForBiometrics(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowPinDialogForBiometrics, performs: perform)
        }
        static func showBiometricsEnableDialog(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowBiometricsEnableDialog, performs: perform)
        }
        static func showBiometricsSuccessDialog(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowBiometricsSuccessDialog, performs: perform)
        }
        static func showIsBiometricsRequired(isBiometricsRequired: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ishowIsBiometricsRequired__isBiometricsRequired(isBiometricsRequired), performs: perform)
        }
        static func showIsPinRequiredOnLaunch(isPinRequiredOnLaunch: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .ishowIsPinRequiredOnLaunch__isPinRequiredOnLaunch(isPinRequiredOnLaunch), performs: perform)
        }
        static func showPinNotAvailableDialog(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowPinNotAvailableDialog, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - SettingTopWireframe
class SettingTopWireframeMock: SettingTopWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentNodeSelect() {
        addInvocation(.ipresentNodeSelect)
		let perform = methodPerformValue(.ipresentNodeSelect) as? () -> Void
		perform?()
    }

    func presentSecurityLesson() {
        addInvocation(.ipresentSecurityLesson)
		let perform = methodPerformValue(.ipresentSecurityLesson) as? () -> Void
		perform?()
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentNodeSelect
        case ipresentSecurityLesson
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentNodeSelect, .ipresentNodeSelect):
                    return true 
                case (.ipresentSecurityLesson, .ipresentSecurityLesson):
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ipresentNodeSelect: return 0
                case .ipresentSecurityLesson: return 0
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentNodeSelect() -> Verify {
            return Verify(method: .ipresentNodeSelect)
        }
        static func presentSecurityLesson() -> Verify {
            return Verify(method: .ipresentSecurityLesson)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentNodeSelect(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentNodeSelect, performs: perform)
        }
        static func presentSecurityLesson(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentSecurityLesson, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionDetailInteractorOutput
class TransactionDetailInteractorOutputMock: TransactionDetailInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func publicKeyFetched(_ publicKey: String?) {
        addInvocation(.ipublicKeyFetched__publicKey(Parameter<String?>.value(publicKey)))
		let perform = methodPerformValue(.ipublicKeyFetched__publicKey(Parameter<String?>.value(publicKey))) as? (String?) -> Void
		perform?(publicKey)
    }

    func publicKeyFetchFailed(_ error: Error) {
        addInvocation(.ipublicKeyFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.ipublicKeyFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case ipublicKeyFetched__publicKey(Parameter<String?>)
        case ipublicKeyFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipublicKeyFetched__publicKey(let lhsPublickey), .ipublicKeyFetched__publicKey(let rhsPublickey)):
                    guard Parameter.compare(lhs: lhsPublickey, rhs: rhsPublickey, with: matcher) else { return false } 
                    return true 
                case (.ipublicKeyFetchFailed__error(let lhsError), .ipublicKeyFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipublicKeyFetched__publicKey(p0): return p0.intValue
                case let .ipublicKeyFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func publicKeyFetched(publicKey: Parameter<String?>) -> Verify {
            return Verify(method: .ipublicKeyFetched__publicKey(publicKey))
        }
        static func publicKeyFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .ipublicKeyFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func publicKeyFetched(publicKey: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .ipublicKeyFetched__publicKey(publicKey), performs: perform)
        }
        static func publicKeyFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .ipublicKeyFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionDetailPresentation
class TransactionDetailPresentationMock: TransactionDetailPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: TransactionDetailView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (TransactionDetailView)?
    var interactor: TransactionDetailUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("TransactionDetailPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (TransactionDetailUseCase)?
    var router: TransactionDetailWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("TransactionDetailPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (TransactionDetailWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<TransactionDetailView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<TransactionDetailUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<TransactionDetailWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickEncrypted() {
        addInvocation(.ididClickEncrypted)
		let perform = methodPerformValue(.ididClickEncrypted) as? () -> Void
		perform?()
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    func didRegisterPin(_ pin: String) {
        addInvocation(.ididRegisterPin__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ididRegisterPin__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func didValidatePin(_ pin: String) {
        addInvocation(.ididValidatePin__pin(Parameter<String>.value(pin)))
		let perform = methodPerformValue(.ididValidatePin__pin(Parameter<String>.value(pin))) as? (String) -> Void
		perform?(pin)
    }

    func didCancelPin() {
        addInvocation(.ididCancelPin)
		let perform = methodPerformValue(.ididCancelPin) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickEncrypted
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case ididRegisterPin__pin(Parameter<String>)
        case ididValidatePin__pin(Parameter<String>)
        case ididCancelPin
        case view_get
		case view_set(Parameter<TransactionDetailView?>)
        case interactor_get
		case interactor_set(Parameter<TransactionDetailUseCase?>)
        case router_get
		case router_set(Parameter<TransactionDetailWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickEncrypted, .ididClickEncrypted):
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.ididRegisterPin__pin(let lhsPin), .ididRegisterPin__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.ididValidatePin__pin(let lhsPin), .ididValidatePin__pin(let rhsPin)):
                    guard Parameter.compare(lhs: lhsPin, rhs: rhsPin, with: matcher) else { return false } 
                    return true 
                case (.ididCancelPin, .ididCancelPin):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<TransactionDetailView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<TransactionDetailUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<TransactionDetailWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickEncrypted: return 0
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case let .ididRegisterPin__pin(p0): return p0.intValue
                case let .ididValidatePin__pin(p0): return p0.intValue
                case .ididCancelPin: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickEncrypted() -> Verify {
            return Verify(method: .ididClickEncrypted)
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
        static func didRegisterPin(pin: Parameter<String>) -> Verify {
            return Verify(method: .ididRegisterPin__pin(pin))
        }
        static func didValidatePin(pin: Parameter<String>) -> Verify {
            return Verify(method: .ididValidatePin__pin(pin))
        }
        static func didCancelPin() -> Verify {
            return Verify(method: .ididCancelPin)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickEncrypted(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickEncrypted, performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
        static func didRegisterPin(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididRegisterPin__pin(pin), performs: perform)
        }
        static func didValidatePin(pin: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ididValidatePin__pin(pin), performs: perform)
        }
        static func didCancelPin(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididCancelPin, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionDetailUseCase
class TransactionDetailUseCaseMock: TransactionDetailUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: TransactionDetailInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("TransactionDetailUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (TransactionDetailInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<TransactionDetailInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchPublicKey(_ address: String) {
        addInvocation(.ifetchPublicKey__address(Parameter<String>.value(address)))
		let perform = methodPerformValue(.ifetchPublicKey__address(Parameter<String>.value(address))) as? (String) -> Void
		perform?(address)
    }

    fileprivate enum MethodType {
        case ifetchPublicKey__address(Parameter<String>)
        case output_get
		case output_set(Parameter<TransactionDetailInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchPublicKey__address(let lhsAddress), .ifetchPublicKey__address(let rhsAddress)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<TransactionDetailInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ifetchPublicKey__address(p0): return p0.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchPublicKey(address: Parameter<String>) -> Verify {
            return Verify(method: .ifetchPublicKey__address(address))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchPublicKey(address: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ifetchPublicKey__address(address), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionDetailView
class TransactionDetailViewMock: TransactionDetailView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: TransactionDetailPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("TransactionDetailViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (TransactionDetailPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<TransactionDetailPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showTransaction(_ transaction: TransferTransactionDetail) {
        addInvocation(.ishowTransaction__transaction(Parameter<TransferTransactionDetail>.value(transaction)))
		let perform = methodPerformValue(.ishowTransaction__transaction(Parameter<TransferTransactionDetail>.value(transaction))) as? (TransferTransactionDetail) -> Void
		perform?(transaction)
    }

    func showMessage(_ message: String) {
        addInvocation(.ishowMessage__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowMessage__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showEncryptedButton() {
        addInvocation(.ishowEncryptedButton)
		let perform = methodPerformValue(.ishowEncryptedButton) as? () -> Void
		perform?()
    }

    func showPublicKeyLoading() {
        addInvocation(.ishowPublicKeyLoading)
		let perform = methodPerformValue(.ishowPublicKeyLoading) as? () -> Void
		perform?()
    }

    func hidePublicKeyLoading() {
        addInvocation(.ihidePublicKeyLoading)
		let perform = methodPerformValue(.ihidePublicKeyLoading) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showPinDialog(presenter: PinDialogMixinPresentation) {
        addInvocation(.ishowPinDialog__presenter_presenter(Parameter<PinDialogMixinPresentation>.value(presenter)))
		let perform = methodPerformValue(.ishowPinDialog__presenter_presenter(Parameter<PinDialogMixinPresentation>.value(presenter))) as? (PinDialogMixinPresentation) -> Void
		perform?(presenter)
    }

    func showPinDialog(forRegistration: Bool, presenter: PinDialogMixinPresentation) {
        addInvocation(.ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<PinDialogMixinPresentation>.value(presenter)))
		let perform = methodPerformValue(.ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<PinDialogMixinPresentation>.value(presenter))) as? (Bool, PinDialogMixinPresentation) -> Void
		perform?(forRegistration, presenter)
    }

    func showPinDialog(forRegistration: Bool, cancelable: Bool, presenter: PinDialogMixinPresentation) {
        addInvocation(.ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<PinDialogMixinPresentation>.value(presenter)))
		let perform = methodPerformValue(.ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(Parameter<Bool>.value(forRegistration), Parameter<Bool>.value(cancelable), Parameter<PinDialogMixinPresentation>.value(presenter))) as? (Bool, Bool, PinDialogMixinPresentation) -> Void
		perform?(forRegistration, cancelable, presenter)
    }

    fileprivate enum MethodType {
        case ishowTransaction__transaction(Parameter<TransferTransactionDetail>)
        case ishowMessage__message(Parameter<String>)
        case ishowEncryptedButton
        case ishowPublicKeyLoading
        case ihidePublicKeyLoading
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case ishowPinDialog__presenter_presenter(Parameter<PinDialogMixinPresentation>)
        case ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(Parameter<Bool>, Parameter<PinDialogMixinPresentation>)
        case ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(Parameter<Bool>, Parameter<Bool>, Parameter<PinDialogMixinPresentation>)
        case presenter_get
		case presenter_set(Parameter<TransactionDetailPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowTransaction__transaction(let lhsTransaction), .ishowTransaction__transaction(let rhsTransaction)):
                    guard Parameter.compare(lhs: lhsTransaction, rhs: rhsTransaction, with: matcher) else { return false } 
                    return true 
                case (.ishowMessage__message(let lhsMessage), .ishowMessage__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowEncryptedButton, .ishowEncryptedButton):
                    return true 
                case (.ishowPublicKeyLoading, .ishowPublicKeyLoading):
                    return true 
                case (.ihidePublicKeyLoading, .ihidePublicKeyLoading):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowPinDialog__presenter_presenter(let lhsPresenter), .ishowPinDialog__presenter_presenter(let rhsPresenter)):
                    guard Parameter.compare(lhs: lhsPresenter, rhs: rhsPresenter, with: matcher) else { return false } 
                    return true 
                case (.ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(let lhsForregistration, let lhsPresenter), .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(let rhsForregistration, let rhsPresenter)):
                    guard Parameter.compare(lhs: lhsForregistration, rhs: rhsForregistration, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsPresenter, rhs: rhsPresenter, with: matcher) else { return false } 
                    return true 
                case (.ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(let lhsForregistration, let lhsCancelable, let lhsPresenter), .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(let rhsForregistration, let rhsCancelable, let rhsPresenter)):
                    guard Parameter.compare(lhs: lhsForregistration, rhs: rhsForregistration, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsCancelable, rhs: rhsCancelable, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsPresenter, rhs: rhsPresenter, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<TransactionDetailPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowTransaction__transaction(p0): return p0.intValue
                case let .ishowMessage__message(p0): return p0.intValue
                case .ishowEncryptedButton: return 0
                case .ishowPublicKeyLoading: return 0
                case .ihidePublicKeyLoading: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case let .ishowPinDialog__presenter_presenter(p0): return p0.intValue
                case let .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(p0, p1): return p0.intValue + p1.intValue
                case let .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showTransaction(transaction: Parameter<TransferTransactionDetail>) -> Verify {
            return Verify(method: .ishowTransaction__transaction(transaction))
        }
        static func showMessage(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowMessage__message(message))
        }
        static func showEncryptedButton() -> Verify {
            return Verify(method: .ishowEncryptedButton)
        }
        static func showPublicKeyLoading() -> Verify {
            return Verify(method: .ishowPublicKeyLoading)
        }
        static func hidePublicKeyLoading() -> Verify {
            return Verify(method: .ihidePublicKeyLoading)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
        static func showPinDialog(presenter: Parameter<PinDialogMixinPresentation>) -> Verify {
            return Verify(method: .ishowPinDialog__presenter_presenter(presenter))
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>) -> Verify {
            return Verify(method: .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(forRegistration, presenter))
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>) -> Verify {
            return Verify(method: .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(forRegistration, cancelable, presenter))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showTransaction(transaction: Parameter<TransferTransactionDetail>, perform: @escaping (TransferTransactionDetail) -> Void) -> Perform {
            return Perform(method: .ishowTransaction__transaction(transaction), performs: perform)
        }
        static func showMessage(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowMessage__message(message), performs: perform)
        }
        static func showEncryptedButton(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowEncryptedButton, performs: perform)
        }
        static func showPublicKeyLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowPublicKeyLoading, performs: perform)
        }
        static func hidePublicKeyLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihidePublicKeyLoading, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
        static func showPinDialog(presenter: Parameter<PinDialogMixinPresentation>, perform: @escaping (PinDialogMixinPresentation) -> Void) -> Perform {
            return Perform(method: .ishowPinDialog__presenter_presenter(presenter), performs: perform)
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>, perform: @escaping (Bool, PinDialogMixinPresentation) -> Void) -> Perform {
            return Perform(method: .ishowPinDialog__forRegistration_forRegistrationpresenter_presenter(forRegistration, presenter), performs: perform)
        }
        static func showPinDialog(forRegistration: Parameter<Bool>, cancelable: Parameter<Bool>, presenter: Parameter<PinDialogMixinPresentation>, perform: @escaping (Bool, Bool, PinDialogMixinPresentation) -> Void) -> Perform {
            return Perform(method: .ishowPinDialog__forRegistration_forRegistrationcancelable_cancelablepresenter_presenter(forRegistration, cancelable, presenter), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionDetailWireframe
class TransactionDetailWireframeMock: TransactionDetailWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule(_ transaction: TransferTransactionDetail) -> UIViewController {
        addInvocation(.sassembleModule__transaction(Parameter<TransferTransactionDetail>.value(transaction)))
		let perform = methodPerformValue(.sassembleModule__transaction(Parameter<TransferTransactionDetail>.value(transaction))) as? (TransferTransactionDetail) -> Void
		perform?(transaction)
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule__transaction(Parameter<TransferTransactionDetail>.value(transaction)))
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(_ transaction: TransferTransactionDetail). Use given")
    }

    fileprivate enum StaticMethodType {
        case sassembleModule__transaction(Parameter<TransferTransactionDetail>)


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule__transaction(let lhsTransaction), .sassembleModule__transaction(let rhsTransaction)):
                    guard Parameter.compare(lhs: lhsTransaction, rhs: rhsTransaction, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sassembleModule__transaction(p0): return p0.intValue
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(transaction: Parameter<TransferTransactionDetail>, willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule__transaction(transaction), returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule(transaction: Parameter<TransferTransactionDetail>) -> StaticVerify {
            return StaticVerify(method: .sassembleModule__transaction(transaction))
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(transaction: Parameter<TransferTransactionDetail>, perform: @escaping (TransferTransactionDetail) -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule__transaction(transaction), performs: perform)
        }
    }

        fileprivate enum MethodType {
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionListInteractorOutput
class TransactionListInteractorOutputMock: TransactionListInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func transferTransactionDetailFetched(_ transactions: [TransferTransactionDetail]) {
        addInvocation(.itransferTransactionDetailFetched__transactions(Parameter<[TransferTransactionDetail]>.value(transactions)))
		let perform = methodPerformValue(.itransferTransactionDetailFetched__transactions(Parameter<[TransferTransactionDetail]>.value(transactions))) as? ([TransferTransactionDetail]) -> Void
		perform?(transactions)
    }

    func transferTransactionDetailFetchFailed(_ error: Error) {
        addInvocation(.itransferTransactionDetailFetchFailed__error(Parameter<Error>.value(error)))
		let perform = methodPerformValue(.itransferTransactionDetailFetchFailed__error(Parameter<Error>.value(error))) as? (Error) -> Void
		perform?(error)
    }

    fileprivate enum MethodType {
        case itransferTransactionDetailFetched__transactions(Parameter<[TransferTransactionDetail]>)
        case itransferTransactionDetailFetchFailed__error(Parameter<Error>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.itransferTransactionDetailFetched__transactions(let lhsTransactions), .itransferTransactionDetailFetched__transactions(let rhsTransactions)):
                    guard Parameter.compare(lhs: lhsTransactions, rhs: rhsTransactions, with: matcher) else { return false } 
                    return true 
                case (.itransferTransactionDetailFetchFailed__error(let lhsError), .itransferTransactionDetailFetchFailed__error(let rhsError)):
                    guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .itransferTransactionDetailFetched__transactions(p0): return p0.intValue
                case let .itransferTransactionDetailFetchFailed__error(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func transferTransactionDetailFetched(transactions: Parameter<[TransferTransactionDetail]>) -> Verify {
            return Verify(method: .itransferTransactionDetailFetched__transactions(transactions))
        }
        static func transferTransactionDetailFetchFailed(error: Parameter<Error>) -> Verify {
            return Verify(method: .itransferTransactionDetailFetchFailed__error(error))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func transferTransactionDetailFetched(transactions: Parameter<[TransferTransactionDetail]>, perform: @escaping ([TransferTransactionDetail]) -> Void) -> Perform {
            return Perform(method: .itransferTransactionDetailFetched__transactions(transactions), performs: perform)
        }
        static func transferTransactionDetailFetchFailed(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .itransferTransactionDetailFetchFailed__error(error), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionListPresentation
class TransactionListPresentationMock: TransactionListPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: TransactionListView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (TransactionListView)?
    var interactor: TransactionListUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("TransactionListPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (TransactionListUseCase)?
    var router: TransactionListWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("TransactionListPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (TransactionListWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<TransactionListView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<TransactionListUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<TransactionListWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didRefresh() {
        addInvocation(.ididRefresh)
		let perform = methodPerformValue(.ididRefresh) as? () -> Void
		perform?()
    }

    func didReachLastRow() {
        addInvocation(.ididReachLastRow)
		let perform = methodPerformValue(.ididReachLastRow) as? () -> Void
		perform?()
    }

    func didClickTransaction(_ transaction: TransferTransactionDetail) {
        addInvocation(.ididClickTransaction__transaction(Parameter<TransferTransactionDetail>.value(transaction)))
		let perform = methodPerformValue(.ididClickTransaction__transaction(Parameter<TransferTransactionDetail>.value(transaction))) as? (TransferTransactionDetail) -> Void
		perform?(transaction)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididRefresh
        case ididReachLastRow
        case ididClickTransaction__transaction(Parameter<TransferTransactionDetail>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<TransactionListView?>)
        case interactor_get
		case interactor_set(Parameter<TransactionListUseCase?>)
        case router_get
		case router_set(Parameter<TransactionListWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididRefresh, .ididRefresh):
                    return true 
                case (.ididReachLastRow, .ididReachLastRow):
                    return true 
                case (.ididClickTransaction__transaction(let lhsTransaction), .ididClickTransaction__transaction(let rhsTransaction)):
                    guard Parameter.compare(lhs: lhsTransaction, rhs: rhsTransaction, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<TransactionListView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<TransactionListUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<TransactionListWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididRefresh: return 0
                case .ididReachLastRow: return 0
                case let .ididClickTransaction__transaction(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didRefresh() -> Verify {
            return Verify(method: .ididRefresh)
        }
        static func didReachLastRow() -> Verify {
            return Verify(method: .ididReachLastRow)
        }
        static func didClickTransaction(transaction: Parameter<TransferTransactionDetail>) -> Verify {
            return Verify(method: .ididClickTransaction__transaction(transaction))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didRefresh(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididRefresh, performs: perform)
        }
        static func didReachLastRow(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididReachLastRow, performs: perform)
        }
        static func didClickTransaction(transaction: Parameter<TransferTransactionDetail>, perform: @escaping (TransferTransactionDetail) -> Void) -> Perform {
            return Perform(method: .ididClickTransaction__transaction(transaction), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionListUseCase
class TransactionListUseCaseMock: TransactionListUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: TransactionListInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("TransactionListUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (TransactionListInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<TransactionListInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func fetchTransferTransactionDetail(_ address: String, id: Int?) {
        addInvocation(.ifetchTransferTransactionDetail__addressid_id(Parameter<String>.value(address), Parameter<Int?>.value(id)))
		let perform = methodPerformValue(.ifetchTransferTransactionDetail__addressid_id(Parameter<String>.value(address), Parameter<Int?>.value(id))) as? (String, Int?) -> Void
		perform?(address, id)
    }

    fileprivate enum MethodType {
        case ifetchTransferTransactionDetail__addressid_id(Parameter<String>, Parameter<Int?>)
        case output_get
		case output_set(Parameter<TransactionListInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ifetchTransferTransactionDetail__addressid_id(let lhsAddress, let lhsId), .ifetchTransferTransactionDetail__addressid_id(let rhsAddress, let rhsId)):
                    guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<TransactionListInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ifetchTransferTransactionDetail__addressid_id(p0, p1): return p0.intValue + p1.intValue
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchTransferTransactionDetail(address: Parameter<String>, id: Parameter<Int?>) -> Verify {
            return Verify(method: .ifetchTransferTransactionDetail__addressid_id(address, id))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchTransferTransactionDetail(address: Parameter<String>, id: Parameter<Int?>, perform: @escaping (String, Int?) -> Void) -> Perform {
            return Perform(method: .ifetchTransferTransactionDetail__addressid_id(address, id), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionListView
class TransactionListViewMock: TransactionListView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: TransactionListPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("TransactionListViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (TransactionListPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<TransactionListPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showLoadingTop() {
        addInvocation(.ishowLoadingTop)
		let perform = methodPerformValue(.ishowLoadingTop) as? () -> Void
		perform?()
    }

    func showLoadingBottom() {
        addInvocation(.ishowLoadingBottom)
		let perform = methodPerformValue(.ishowLoadingBottom) as? () -> Void
		perform?()
    }

    func hideLoading() {
        addInvocation(.ihideLoading)
		let perform = methodPerformValue(.ihideLoading) as? () -> Void
		perform?()
    }

    func showEmpty() {
        addInvocation(.ishowEmpty)
		let perform = methodPerformValue(.ishowEmpty) as? () -> Void
		perform?()
    }

    func showTransactions(_ transactions: [[TransferTransactionDetail]]) {
        addInvocation(.ishowTransactions__transactions(Parameter<[[TransferTransactionDetail]]>.value(transactions)))
		let perform = methodPerformValue(.ishowTransactions__transactions(Parameter<[[TransferTransactionDetail]]>.value(transactions))) as? ([[TransferTransactionDetail]]) -> Void
		perform?(transactions)
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowLoadingTop
        case ishowLoadingBottom
        case ihideLoading
        case ishowEmpty
        case ishowTransactions__transactions(Parameter<[[TransferTransactionDetail]]>)
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<TransactionListPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowLoadingTop, .ishowLoadingTop):
                    return true 
                case (.ishowLoadingBottom, .ishowLoadingBottom):
                    return true 
                case (.ihideLoading, .ihideLoading):
                    return true 
                case (.ishowEmpty, .ishowEmpty):
                    return true 
                case (.ishowTransactions__transactions(let lhsTransactions), .ishowTransactions__transactions(let rhsTransactions)):
                    guard Parameter.compare(lhs: lhsTransactions, rhs: rhsTransactions, with: matcher) else { return false } 
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<TransactionListPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ishowLoadingTop: return 0
                case .ishowLoadingBottom: return 0
                case .ihideLoading: return 0
                case .ishowEmpty: return 0
                case let .ishowTransactions__transactions(p0): return p0.intValue
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showLoadingTop() -> Verify {
            return Verify(method: .ishowLoadingTop)
        }
        static func showLoadingBottom() -> Verify {
            return Verify(method: .ishowLoadingBottom)
        }
        static func hideLoading() -> Verify {
            return Verify(method: .ihideLoading)
        }
        static func showEmpty() -> Verify {
            return Verify(method: .ishowEmpty)
        }
        static func showTransactions(transactions: Parameter<[[TransferTransactionDetail]]>) -> Verify {
            return Verify(method: .ishowTransactions__transactions(transactions))
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showLoadingTop(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoadingTop, performs: perform)
        }
        static func showLoadingBottom(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowLoadingBottom, performs: perform)
        }
        static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ihideLoading, performs: perform)
        }
        static func showEmpty(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowEmpty, performs: perform)
        }
        static func showTransactions(transactions: Parameter<[[TransferTransactionDetail]]>, perform: @escaping ([[TransferTransactionDetail]]) -> Void) -> Perform {
            return Perform(method: .ishowTransactions__transactions(transactions), performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - TransactionListWireframe
class TransactionListWireframeMock: TransactionListWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentTransactionDetail(_ transaction: TransferTransactionDetail) {
        addInvocation(.ipresentTransactionDetail__transaction(Parameter<TransferTransactionDetail>.value(transaction)))
		let perform = methodPerformValue(.ipresentTransactionDetail__transaction(Parameter<TransferTransactionDetail>.value(transaction))) as? (TransferTransactionDetail) -> Void
		perform?(transaction)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentTransactionDetail__transaction(Parameter<TransferTransactionDetail>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentTransactionDetail__transaction(let lhsTransaction), .ipresentTransactionDetail__transaction(let rhsTransaction)):
                    guard Parameter.compare(lhs: lhsTransaction, rhs: rhsTransaction, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ipresentTransactionDetail__transaction(p0): return p0.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentTransactionDetail(transaction: Parameter<TransferTransactionDetail>) -> Verify {
            return Verify(method: .ipresentTransactionDetail__transaction(transaction))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentTransactionDetail(transaction: Parameter<TransferTransactionDetail>, perform: @escaping (TransferTransactionDetail) -> Void) -> Perform {
            return Perform(method: .ipresentTransactionDetail__transaction(transaction), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - WalletSelectInteractorOutput
class WalletSelectInteractorOutputMock: WalletSelectInteractorOutput, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func activeIdFetched(_ id: String?) {
        addInvocation(.iactiveIdFetched__id(Parameter<String?>.value(id)))
		let perform = methodPerformValue(.iactiveIdFetched__id(Parameter<String?>.value(id))) as? (String?) -> Void
		perform?(id)
    }

    func walletsFetched(_ wallets: [Wallet]) {
        addInvocation(.iwalletsFetched__wallets(Parameter<[Wallet]>.value(wallets)))
		let perform = methodPerformValue(.iwalletsFetched__wallets(Parameter<[Wallet]>.value(wallets))) as? ([Wallet]) -> Void
		perform?(wallets)
    }

    fileprivate enum MethodType {
        case iactiveIdFetched__id(Parameter<String?>)
        case iwalletsFetched__wallets(Parameter<[Wallet]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.iactiveIdFetched__id(let lhsId), .iactiveIdFetched__id(let rhsId)):
                    guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                    return true 
                case (.iwalletsFetched__wallets(let lhsWallets), .iwalletsFetched__wallets(let rhsWallets)):
                    guard Parameter.compare(lhs: lhsWallets, rhs: rhsWallets, with: matcher) else { return false } 
                    return true 
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .iactiveIdFetched__id(p0): return p0.intValue
                case let .iwalletsFetched__wallets(p0): return p0.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func activeIdFetched(id: Parameter<String?>) -> Verify {
            return Verify(method: .iactiveIdFetched__id(id))
        }
        static func walletsFetched(wallets: Parameter<[Wallet]>) -> Verify {
            return Verify(method: .iwalletsFetched__wallets(wallets))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func activeIdFetched(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .iactiveIdFetched__id(id), performs: perform)
        }
        static func walletsFetched(wallets: Parameter<[Wallet]>, perform: @escaping ([Wallet]) -> Void) -> Perform {
            return Perform(method: .iwalletsFetched__wallets(wallets), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - WalletSelectPresentation
class WalletSelectPresentationMock: WalletSelectPresentation, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var view: WalletSelectView? { 
		get {	invocations.append(.view_get)
				return __view }
		set {	invocations.append(.view_set(.value(newValue)))
				__view = newValue }
	}
	private var __view: (WalletSelectView)?
    var interactor: WalletSelectUseCase! { 
		get {	invocations.append(.interactor_get)
				return __interactor.orFail("WalletSelectPresentationMock - value for interactor was not defined") }
		set {	invocations.append(.interactor_set(.value(newValue)))
				__interactor = newValue }
	}
	private var __interactor: (WalletSelectUseCase)?
    var router: WalletSelectWireframe! { 
		get {	invocations.append(.router_get)
				return __router.orFail("WalletSelectPresentationMock - value for router was not defined") }
		set {	invocations.append(.router_set(.value(newValue)))
				__router = newValue }
	}
	private var __router: (WalletSelectWireframe)?

    struct Property {
        fileprivate var method: MethodType
        static var view: Property { return Property(method: .view_get) }
		static func view(set newValue: Parameter<WalletSelectView?>) -> Property { return Property(method: .view_set(newValue)) }
        static var interactor: Property { return Property(method: .interactor_get) }
		static func interactor(set newValue: Parameter<WalletSelectUseCase?>) -> Property { return Property(method: .interactor_set(newValue)) }
        static var router: Property { return Property(method: .router_get) }
		static func router(set newValue: Parameter<WalletSelectWireframe?>) -> Property { return Property(method: .router_set(newValue)) }
    }


    func didClickCreate() {
        addInvocation(.ididClickCreate)
		let perform = methodPerformValue(.ididClickCreate) as? () -> Void
		perform?()
    }

    func didSelectWallet(_ wallet: Wallet) {
        addInvocation(.ididSelectWallet__wallet(Parameter<Wallet>.value(wallet)))
		let perform = methodPerformValue(.ididSelectWallet__wallet(Parameter<Wallet>.value(wallet))) as? (Wallet) -> Void
		perform?(wallet)
    }

    func didClickSetting(_ wallet: Wallet) {
        addInvocation(.ididClickSetting__wallet(Parameter<Wallet>.value(wallet)))
		let perform = methodPerformValue(.ididClickSetting__wallet(Parameter<Wallet>.value(wallet))) as? (Wallet) -> Void
		perform?(wallet)
    }

    func viewDidLoad() {
        addInvocation(.iviewDidLoad)
		let perform = methodPerformValue(.iviewDidLoad) as? () -> Void
		perform?()
    }

    func viewWillAppear() {
        addInvocation(.iviewWillAppear)
		let perform = methodPerformValue(.iviewWillAppear) as? () -> Void
		perform?()
    }

    func viewDidAppear() {
        addInvocation(.iviewDidAppear)
		let perform = methodPerformValue(.iviewDidAppear) as? () -> Void
		perform?()
    }

    func viewWillDisappear() {
        addInvocation(.iviewWillDisappear)
		let perform = methodPerformValue(.iviewWillDisappear) as? () -> Void
		perform?()
    }

    func viewDidDisappear() {
        addInvocation(.iviewDidDisappear)
		let perform = methodPerformValue(.iviewDidDisappear) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case ididClickCreate
        case ididSelectWallet__wallet(Parameter<Wallet>)
        case ididClickSetting__wallet(Parameter<Wallet>)
        case iviewDidLoad
        case iviewWillAppear
        case iviewDidAppear
        case iviewWillDisappear
        case iviewDidDisappear
        case view_get
		case view_set(Parameter<WalletSelectView?>)
        case interactor_get
		case interactor_set(Parameter<WalletSelectUseCase?>)
        case router_get
		case router_set(Parameter<WalletSelectWireframe?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ididClickCreate, .ididClickCreate):
                    return true 
                case (.ididSelectWallet__wallet(let lhsWallet), .ididSelectWallet__wallet(let rhsWallet)):
                    guard Parameter.compare(lhs: lhsWallet, rhs: rhsWallet, with: matcher) else { return false } 
                    return true 
                case (.ididClickSetting__wallet(let lhsWallet), .ididClickSetting__wallet(let rhsWallet)):
                    guard Parameter.compare(lhs: lhsWallet, rhs: rhsWallet, with: matcher) else { return false } 
                    return true 
                case (.iviewDidLoad, .iviewDidLoad):
                    return true 
                case (.iviewWillAppear, .iviewWillAppear):
                    return true 
                case (.iviewDidAppear, .iviewDidAppear):
                    return true 
                case (.iviewWillDisappear, .iviewWillDisappear):
                    return true 
                case (.iviewDidDisappear, .iviewDidDisappear):
                    return true 
                case (.view_get,.view_get): return true
				case (.view_set(let left),.view_set(let right)): return Parameter<WalletSelectView?>.compare(lhs: left, rhs: right, with: matcher)
                case (.interactor_get,.interactor_get): return true
				case (.interactor_set(let left),.interactor_set(let right)): return Parameter<WalletSelectUseCase?>.compare(lhs: left, rhs: right, with: matcher)
                case (.router_get,.router_get): return true
				case (.router_set(let left),.router_set(let right)): return Parameter<WalletSelectWireframe?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ididClickCreate: return 0
                case let .ididSelectWallet__wallet(p0): return p0.intValue
                case let .ididClickSetting__wallet(p0): return p0.intValue
                case .iviewDidLoad: return 0
                case .iviewWillAppear: return 0
                case .iviewDidAppear: return 0
                case .iviewWillDisappear: return 0
                case .iviewDidDisappear: return 0
                case .view_get: return 0
				case .view_set(let newValue): return newValue.intValue
                case .interactor_get: return 0
				case .interactor_set(let newValue): return newValue.intValue
                case .router_get: return 0
				case .router_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func didClickCreate() -> Verify {
            return Verify(method: .ididClickCreate)
        }
        static func didSelectWallet(wallet: Parameter<Wallet>) -> Verify {
            return Verify(method: .ididSelectWallet__wallet(wallet))
        }
        static func didClickSetting(wallet: Parameter<Wallet>) -> Verify {
            return Verify(method: .ididClickSetting__wallet(wallet))
        }
        static func viewDidLoad() -> Verify {
            return Verify(method: .iviewDidLoad)
        }
        static func viewWillAppear() -> Verify {
            return Verify(method: .iviewWillAppear)
        }
        static func viewDidAppear() -> Verify {
            return Verify(method: .iviewDidAppear)
        }
        static func viewWillDisappear() -> Verify {
            return Verify(method: .iviewWillDisappear)
        }
        static func viewDidDisappear() -> Verify {
            return Verify(method: .iviewDidDisappear)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didClickCreate(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ididClickCreate, performs: perform)
        }
        static func didSelectWallet(wallet: Parameter<Wallet>, perform: @escaping (Wallet) -> Void) -> Perform {
            return Perform(method: .ididSelectWallet__wallet(wallet), performs: perform)
        }
        static func didClickSetting(wallet: Parameter<Wallet>, perform: @escaping (Wallet) -> Void) -> Perform {
            return Perform(method: .ididClickSetting__wallet(wallet), performs: perform)
        }
        static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidLoad, performs: perform)
        }
        static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillAppear, performs: perform)
        }
        static func viewDidAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidAppear, performs: perform)
        }
        static func viewWillDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewWillDisappear, performs: perform)
        }
        static func viewDidDisappear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .iviewDidDisappear, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - WalletSelectUseCase
class WalletSelectUseCaseMock: WalletSelectUseCase, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var output: WalletSelectInteractorOutput! { 
		get {	invocations.append(.output_get)
				return __output.orFail("WalletSelectUseCaseMock - value for output was not defined") }
		set {	invocations.append(.output_set(.value(newValue)))
				__output = newValue }
	}
	private var __output: (WalletSelectInteractorOutput)?

    struct Property {
        fileprivate var method: MethodType
        static var output: Property { return Property(method: .output_get) }
		static func output(set newValue: Parameter<WalletSelectInteractorOutput?>) -> Property { return Property(method: .output_set(newValue)) }
    }


    func activateWallet(_ id: String) {
        addInvocation(.iactivateWallet__id(Parameter<String>.value(id)))
		let perform = methodPerformValue(.iactivateWallet__id(Parameter<String>.value(id))) as? (String) -> Void
		perform?(id)
    }

    func fetchActiveId() {
        addInvocation(.ifetchActiveId)
		let perform = methodPerformValue(.ifetchActiveId) as? () -> Void
		perform?()
    }

    func fetchWallets() {
        addInvocation(.ifetchWallets)
		let perform = methodPerformValue(.ifetchWallets) as? () -> Void
		perform?()
    }

    fileprivate enum MethodType {
        case iactivateWallet__id(Parameter<String>)
        case ifetchActiveId
        case ifetchWallets
        case output_get
		case output_set(Parameter<WalletSelectInteractorOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.iactivateWallet__id(let lhsId), .iactivateWallet__id(let rhsId)):
                    guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                    return true 
                case (.ifetchActiveId, .ifetchActiveId):
                    return true 
                case (.ifetchWallets, .ifetchWallets):
                    return true 
                case (.output_get,.output_get): return true
				case (.output_set(let left),.output_set(let right)): return Parameter<WalletSelectInteractorOutput?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .iactivateWallet__id(p0): return p0.intValue
                case .ifetchActiveId: return 0
                case .ifetchWallets: return 0
                case .output_get: return 0
				case .output_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func activateWallet(id: Parameter<String>) -> Verify {
            return Verify(method: .iactivateWallet__id(id))
        }
        static func fetchActiveId() -> Verify {
            return Verify(method: .ifetchActiveId)
        }
        static func fetchWallets() -> Verify {
            return Verify(method: .ifetchWallets)
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func activateWallet(id: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .iactivateWallet__id(id), performs: perform)
        }
        static func fetchActiveId(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ifetchActiveId, performs: perform)
        }
        static func fetchWallets(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ifetchWallets, performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - WalletSelectView
class WalletSelectViewMock: WalletSelectView, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default

    var presenter: WalletSelectPresentation! { 
		get {	invocations.append(.presenter_get)
				return __presenter.orFail("WalletSelectViewMock - value for presenter was not defined") }
		set {	invocations.append(.presenter_set(.value(newValue)))
				__presenter = newValue }
	}
	private var __presenter: (WalletSelectPresentation)?

    struct Property {
        fileprivate var method: MethodType
        static var presenter: Property { return Property(method: .presenter_get) }
		static func presenter(set newValue: Parameter<WalletSelectPresentation?>) -> Property { return Property(method: .presenter_set(newValue)) }
    }


    func showActiveId(_ activeId: String?) {
        addInvocation(.ishowActiveId__activeId(Parameter<String?>.value(activeId)))
		let perform = methodPerformValue(.ishowActiveId__activeId(Parameter<String?>.value(activeId))) as? (String?) -> Void
		perform?(activeId)
    }

    func showWallets(_ wallets: [Wallet]) {
        addInvocation(.ishowWallets__wallets(Parameter<[Wallet]>.value(wallets)))
		let perform = methodPerformValue(.ishowWallets__wallets(Parameter<[Wallet]>.value(wallets))) as? ([Wallet]) -> Void
		perform?(wallets)
    }

    func showWalletEmpty() {
        addInvocation(.ishowWalletEmpty)
		let perform = methodPerformValue(.ishowWalletEmpty) as? () -> Void
		perform?()
    }

    func showInfo(_ message: String) {
        addInvocation(.ishowInfo__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowInfo__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    func showError(_ message: String) {
        addInvocation(.ishowError__message(Parameter<String>.value(message)))
		let perform = methodPerformValue(.ishowError__message(Parameter<String>.value(message))) as? (String) -> Void
		perform?(message)
    }

    fileprivate enum MethodType {
        case ishowActiveId__activeId(Parameter<String?>)
        case ishowWallets__wallets(Parameter<[Wallet]>)
        case ishowWalletEmpty
        case ishowInfo__message(Parameter<String>)
        case ishowError__message(Parameter<String>)
        case presenter_get
		case presenter_set(Parameter<WalletSelectPresentation?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ishowActiveId__activeId(let lhsActiveid), .ishowActiveId__activeId(let rhsActiveid)):
                    guard Parameter.compare(lhs: lhsActiveid, rhs: rhsActiveid, with: matcher) else { return false } 
                    return true 
                case (.ishowWallets__wallets(let lhsWallets), .ishowWallets__wallets(let rhsWallets)):
                    guard Parameter.compare(lhs: lhsWallets, rhs: rhsWallets, with: matcher) else { return false } 
                    return true 
                case (.ishowWalletEmpty, .ishowWalletEmpty):
                    return true 
                case (.ishowInfo__message(let lhsMessage), .ishowInfo__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.ishowError__message(let lhsMessage), .ishowError__message(let rhsMessage)):
                    guard Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher) else { return false } 
                    return true 
                case (.presenter_get,.presenter_get): return true
				case (.presenter_set(let left),.presenter_set(let right)): return Parameter<WalletSelectPresentation?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .ishowActiveId__activeId(p0): return p0.intValue
                case let .ishowWallets__wallets(p0): return p0.intValue
                case .ishowWalletEmpty: return 0
                case let .ishowInfo__message(p0): return p0.intValue
                case let .ishowError__message(p0): return p0.intValue
                case .presenter_get: return 0
				case .presenter_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func showActiveId(activeId: Parameter<String?>) -> Verify {
            return Verify(method: .ishowActiveId__activeId(activeId))
        }
        static func showWallets(wallets: Parameter<[Wallet]>) -> Verify {
            return Verify(method: .ishowWallets__wallets(wallets))
        }
        static func showWalletEmpty() -> Verify {
            return Verify(method: .ishowWalletEmpty)
        }
        static func showInfo(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowInfo__message(message))
        }
        static func showError(message: Parameter<String>) -> Verify {
            return Verify(method: .ishowError__message(message))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func showActiveId(activeId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .ishowActiveId__activeId(activeId), performs: perform)
        }
        static func showWallets(wallets: Parameter<[Wallet]>, perform: @escaping ([Wallet]) -> Void) -> Perform {
            return Perform(method: .ishowWallets__wallets(wallets), performs: perform)
        }
        static func showWalletEmpty(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ishowWalletEmpty, performs: perform)
        }
        static func showInfo(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowInfo__message(message), performs: perform)
        }
        static func showError(message: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .ishowError__message(message), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

// MARK: - WalletSelectWireframe
class WalletSelectWireframeMock: WalletSelectWireframe, Mock, StaticMock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    static var matcher: Matcher = Matcher.default
    static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    var viewController: UIViewController? { 
		get {	invocations.append(.viewController_get)
				return __viewController }
		set {	invocations.append(.viewController_set(.value(newValue)))
				__viewController = newValue }
	}
	private var __viewController: (UIViewController)?

    struct Property {
        fileprivate var method: MethodType
        static var viewController: Property { return Property(method: .viewController_get) }
		static func viewController(set newValue: Parameter<UIViewController?>) -> Property { return Property(method: .viewController_set(newValue)) }
    }

    typealias StaticProperty = Swift.Never

    static func assembleModule() -> UIViewController {
        addInvocation(.sassembleModule)
		let perform = methodPerformValue(.sassembleModule) as? () -> Void
		perform?()
		let givenValue: (value: Any?, error: Error?) = methodReturnValue(.sassembleModule)
		let value = givenValue.value as? UIViewController
		return value.orFail("stub return value not specified for assembleModule(). Use given")
    }

    func presentCreate() {
        addInvocation(.ipresentCreate)
		let perform = methodPerformValue(.ipresentCreate) as? () -> Void
		perform?()
    }

    func presentSetting(for wallet: Wallet) {
        addInvocation(.ipresentSetting__for_wallet(Parameter<Wallet>.value(wallet)))
		let perform = methodPerformValue(.ipresentSetting__for_wallet(Parameter<Wallet>.value(wallet))) as? (Wallet) -> Void
		perform?(wallet)
    }

    fileprivate enum StaticMethodType {
        case sassembleModule


        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.sassembleModule, .sassembleModule):
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case .sassembleModule: return 0
            }
        }
    }

    struct StaticGiven {
        fileprivate var method: StaticMethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: StaticMethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

        static func assembleModule(willReturn: UIViewController) -> StaticGiven {
            return StaticGiven(method: .sassembleModule, returns: willReturn, throws: nil)
        }
    }

    struct StaticVerify {
        fileprivate var method: StaticMethodType

        static func assembleModule() -> StaticVerify {
            return StaticVerify(method: .sassembleModule)
        }
    }

    struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        static func assembleModule(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sassembleModule, performs: perform)
        }
    }

        fileprivate enum MethodType {
        case ipresentCreate
        case ipresentSetting__for_wallet(Parameter<Wallet>)
        case viewController_get
		case viewController_set(Parameter<UIViewController?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.ipresentCreate, .ipresentCreate):
                    return true 
                case (.ipresentSetting__for_wallet(let lhsWallet), .ipresentSetting__for_wallet(let rhsWallet)):
                    guard Parameter.compare(lhs: lhsWallet, rhs: rhsWallet, with: matcher) else { return false } 
                    return true 
                case (.viewController_get,.viewController_get): return true
				case (.viewController_set(let left),.viewController_set(let right)): return Parameter<UIViewController?>.compare(lhs: left, rhs: right, with: matcher)
                default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .ipresentCreate: return 0
                case let .ipresentSetting__for_wallet(p0): return p0.intValue
                case .viewController_get: return 0
				case .viewController_set(let newValue): return newValue.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func presentCreate() -> Verify {
            return Verify(method: .ipresentCreate)
        }
        static func presentSetting(for wallet: Parameter<Wallet>) -> Verify {
            return Verify(method: .ipresentSetting__for_wallet(wallet))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func presentCreate(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .ipresentCreate, performs: perform)
        }
        static func presentSetting(for wallet: Parameter<Wallet>, perform: @escaping (Wallet) -> Void) -> Perform {
            return Perform(method: .ipresentSetting__for_wallet(wallet), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(property.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(property.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }

    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    static public func verify(property: StaticProperty, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }

    static private func methodReturnValue(_ method: StaticMethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

