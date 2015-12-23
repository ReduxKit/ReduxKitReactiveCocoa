//
//  ReduxKitReactiveCocoa.swift
//  ReduxKitReactiveCocoa
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import ReactiveCocoa
import ReduxKit


/**

 Uses `createStateStream` to create a `ReduxKit.Store<State>` using a
 `ReactiveCocoa.Observer<State, NoError>` stream.

 */
public func createStore<State>(reducer: ((State?, ReduxKit.Action) -> State), state: State? = nil) -> Store<State> {
    return createStreamStore(createStream, reducer: reducer, state: nil)
}


/**

 Accepts a `State` and returns `ReduxKit.StateStream<State>` using a
 `ReactiveCocoa.Observer<State, NoError>` as the stream provider.

 */
public func createStream<State>(state: State) -> StateStream<State> {

    var latest: State = state
    let (signal, observer) = Signal<State, NoError>.pipe()

    signal.observeNext { latest = $0 }
    observer.sendNext(state)

    func subscribe(subscriber: State -> ()) -> ReduxDisposable {
        subscriber(latest)
        return createDisposable(signal.observeNext(subscriber))
    }

    return StateStream(dispatch: observer.sendNext, subscribe: subscribe, getState: { latest })
}


/**

 Accepts a `ReactiveCocoa.Disposable` and returns it wrapped as a `ReduxDisposable`.

 */
public func createDisposable(rawDisposable: Disposable?) -> ReduxDisposable {

    if let disposable = rawDisposable {
        return SimpleReduxDisposable(disposed: { disposable.disposed }, dispose: disposable.dispose)
    }

    return SimpleReduxDisposable(disposed: { false }, dispose: {})
}
