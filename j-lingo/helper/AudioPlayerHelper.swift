import AVFoundation

class AudioPlayerHelper: NSObject {
    var audioPlayer: AVAudioPlayer?
    var completionHandler: (() -> Void)?

    func playAudioOnce(url: URL, completion: @escaping () -> Void) {
        self.completionHandler = completion

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
            completion() // Call completion even if there’s an error
        }
    }
}

extension AudioPlayerHelper: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Call the completion handler when the audio finishes playing
        completionHandler?()
    }
}

