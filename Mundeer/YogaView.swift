
import SwiftUI

struct YogaView: View {
    @State private var expandedPoseID: UUID?

    let yogaPoses: [YogaPose] = [
        YogaPose(
            name: "Tadasana (Mountain Pose)",
            description: "A foundational standing pose that improves posture and balance.",
            imageName: "mountain",
            benefits: "Improves posture, strengthens thighs and knees, relieves sciatica.",
            difficulty: "Beginner",
            duration: "1–2 minutes",
            instructions: "Stand tall with feet together, arms at sides. Inhale and raise arms overhead, stretch upward through the fingertips while keeping feet grounded."
        ),
        YogaPose(
            name: "TreePose)",
            description: "Enhances balance and strengthens legs.",
            imageName: "vrikshasana",
            benefits: "Improves balance, strengthens legs, opens hips.",
            difficulty: "Beginner–Intermediate",
            duration: "30 seconds each leg",
            instructions: "Shift weight to one foot, place the other foot on the inner thigh or calf, bring hands to prayer or overhead."
        ),
        YogaPose(
            name: "Adho Mukha Svanasana (Downward Dog)",
            description: "A rejuvenating stretch for the whole body.",
            imageName: "downwarddog",
            benefits: "Strengthens arms and legs, stretches back, improves circulation.",
            difficulty: "Intermediate",
            duration: "1–3 minutes",
            instructions: "Start on all fours, lift hips up and back to form an inverted V shape, press heels toward the floor."
        ),
        YogaPose(
            name: "Bhujangasana (Cobra Pose)",
            description: "Opens the chest and strengthens the spine.",
            imageName: "cobra",
            benefits: "Strengthens spine, improves flexibility, reduces fatigue.",
            difficulty: "Beginner",
            duration: "15–30 seconds",
            instructions: "Lie on stomach, hands under shoulders, inhale and lift chest keeping elbows close to body."
        ),
        YogaPose(
            name: "ChildPose",
            description: "A resting pose that calms the mind.",
            imageName: "childpose",
            benefits: "Relieves stress, gently stretches back and hips, calms nervous system.",
            difficulty: "Beginner",
            duration: "1–5 minutes",
            instructions: "Kneel, sit on heels, fold forward with arms extended or by your sides, rest forehead on the ground."
        ),
        YogaPose(
            name: "Trikonasana (Triangle Pose)",
            description: "A standing pose that improves flexibility and balance.",
            imageName: "triangle",
            benefits: "Stretches hips, spine, chest, strengthens legs.",
            difficulty: "Intermediate",
            duration: "30 seconds each side",
            instructions: "Stand with feet wide, turn one foot out, extend arms, reach over the leg and tilt torso sideways."
        ),
        YogaPose(
            name: "Setu Bandhasana (Bridge Pose)",
            description: "A backbend that strengthens and energizes.",
            imageName: "bridge",
            benefits: "Strengthens back, glutes, stretches chest and spine, calms the brain.",
            difficulty: "Beginner–Intermediate",
            duration: "30–60 seconds",
            instructions: "Lie on your back, bend knees, place feet flat, lift hips while keeping shoulders on the mat."
        ),
        YogaPose(
            name: "Savasana (Corpse Pose)",
            description: "A final relaxation pose to absorb the practice.",
            imageName: "savasana",
            benefits: "Relaxes body, reduces stress, calms the mind.",
            difficulty: "Beginner",
            duration: "5–15 minutes",
            instructions: "Lie flat on your back with arms and legs relaxed, close eyes, breathe naturally, stay still and present."
        )
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(yogaPoses) { pose in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(pose.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(pose.name)
                                        .font(.headline)

                                    Text(pose.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Image(systemName: expandedPoseID == pose.id ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .onTapGesture {
                                withAnimation {
                                    expandedPoseID = expandedPoseID == pose.id ? nil : pose.id
                                }
                            }

                            if expandedPoseID == pose.id {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("🧘 Benefits: \(pose.benefits)")
                                    Text("📈 Difficulty: \(pose.difficulty)")
                                    Text("⏱️ Duration: \(pose.duration)")
                                    Text("📋 Instructions: \(pose.instructions)")
                                }
                                .font(.caption)
                                .padding(.top, 5)
                                .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("🧘 Yoga Guide")
        }
    }
}
#Preview {
    YogaView()
}
