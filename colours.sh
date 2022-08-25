#!/bin/bash

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Colours  "
sleep 0.1

# Import scripts
source ./tools/colours/define_colour.sh

define_colours(){

    define_colour BLACK 000 000000
    define_colour WHITE FFF FFFFFF

    define_colour SLATE 50 f8fafc
    define_colour SLATE 100 f1f5f9
    define_colour SLATE 200 e2e8f0
    define_colour SLATE 300 cbd5e1
    define_colour SLATE 400 94a3b8
    define_colour SLATE 500 64748b
    define_colour SLATE 600 475569
    define_colour SLATE 700 334155
    define_colour SLATE 800 1e293b
    define_colour SLATE 900 0f172a

    define_colour GRAY 50 f9fafb
    define_colour GRAY 100 f3f4f6
    define_colour GRAY 200 e5e7eb
    define_colour GRAY 300 d1d5db
    define_colour GRAY 400 9ca3af
    define_colour GRAY 500 6b7280
    define_colour GRAY 600 4b5563
    define_colour GRAY 700 374151
    define_colour GRAY 800 1f2937
    define_colour GRAY 900 111827

    define_colour ZINC 50 fafafa
    define_colour ZINC 100 f4f4f5
    define_colour ZINC 200 e4e4e7
    define_colour ZINC 300 d4d4d8
    define_colour ZINC 400 a1a1aa
    define_colour ZINC 500 71717a
    define_colour ZINC 600 52525b
    define_colour ZINC 700 3f3f46
    define_colour ZINC 800 27272a
    define_colour ZINC 900 18181b

    define_colour NEUTRAL 50 fafafa
    define_colour NEUTRAL 100 f5f5f5
    define_colour NEUTRAL 200 e5e5e5
    define_colour NEUTRAL 300 d4d4d4
    define_colour NEUTRAL 400 a3a3a3
    define_colour NEUTRAL 500 737373
    define_colour NEUTRAL 600 525252
    define_colour NEUTRAL 700 404040
    define_colour NEUTRAL 800 262626
    define_colour NEUTRAL 900 171717

    define_colour STONE 50 fafaf9
    define_colour STONE 100 f5f5f4
    define_colour STONE 200 e7e5e4
    define_colour STONE 300 d6d3d1
    define_colour STONE 400 a8a29e
    define_colour STONE 500 78716c
    define_colour STONE 600 57534e
    define_colour STONE 700 44403c
    define_colour STONE 800 292524
    define_colour STONE 900 1c1917

    define_colour ROSE 50 FFF1F2
    define_colour ROSE 100 FFE4E6
    define_colour ROSE 200 FECDD3
    define_colour ROSE 300 FDA4AF
    define_colour ROSE 400 FB7185
    define_colour ROSE 500 F43F5E
    define_colour ROSE 600 E11D48
    define_colour ROSE 700 BE123C
    define_colour ROSE 800 9F1239
    define_colour ROSE 900 881337

    define_colour PINK 50 FDF2F8
    define_colour PINK 100 FCE7F3
    define_colour PINK 200 FBCFE8
    define_colour PINK 300 F9A8D4
    define_colour PINK 400 F472B6
    define_colour PINK 500 EC4899
    define_colour PINK 600 DB2777
    define_colour PINK 700 BE185D
    define_colour PINK 800 9D174D
    define_colour PINK 900 831843

    define_colour FUCHSIA 50 FDF4FF
    define_colour FUCHSIA 100 FAE8FF
    define_colour FUCHSIA 200 F5D0FE
    define_colour FUCHSIA 300 F0ABFC
    define_colour FUCHSIA 400 E879F9
    define_colour FUCHSIA 500 D946EF
    define_colour FUCHSIA 600 C026D3
    define_colour FUCHSIA 700 A21CAF
    define_colour FUCHSIA 800 86198F
    define_colour FUCHSIA 900 701A75

    define_colour PURPLE 50 FAF5FF
    define_colour PURPLE 100 F3E8FF
    define_colour PURPLE 200 E9D5FF
    define_colour PURPLE 300 D8B4FE
    define_colour PURPLE 400 C084FC
    define_colour PURPLE 500 A855F7
    define_colour PURPLE 600 9333EA
    define_colour PURPLE 700 7E22CE
    define_colour PURPLE 800 6B21A8
    define_colour PURPLE 900 581C87

    define_colour VIOLET 50 F5F3FF
    define_colour VIOLET 100 EDE9FE
    define_colour VIOLET 200 DDD6FE
    define_colour VIOLET 300 C4B5FD
    define_colour VIOLET 400 A78BFA
    define_colour VIOLET 500 8B5CF6
    define_colour VIOLET 600 7C3AED
    define_colour VIOLET 700 6D28D9
    define_colour VIOLET 800 5B21B6
    define_colour VIOLET 900 4C1D95

    define_colour INDIGO 50 EEF2FF
    define_colour INDIGO 100 E0E7FF
    define_colour INDIGO 200 C7D2FE
    define_colour INDIGO 300 A5B4FC
    define_colour INDIGO 400 818CF8
    define_colour INDIGO 500 6366F1
    define_colour INDIGO 600 4F46E5
    define_colour INDIGO 700 4338CA
    define_colour INDIGO 800 3730A3
    define_colour INDIGO 900 312E81

    define_colour BLUE 50 EFF6FF
    define_colour BLUE 100 DBEAFE
    define_colour BLUE 200 BFDBFE
    define_colour BLUE 300 93C5FD
    define_colour BLUE 400 60A5FA
    define_colour BLUE 500 3B82F6
    define_colour BLUE 600 2563EB
    define_colour BLUE 700 1D4ED8
    define_colour BLUE 800 1E40AF
    define_colour BLUE 900 1E3A8A

    define_colour SKY 50 F0F9FF
    define_colour SKY 100 E0F2FE
    define_colour SKY 200 BAE6FD
    define_colour SKY 300 7DD3FC
    define_colour SKY 400 38BDF8
    define_colour SKY 500 0EA5E9
    define_colour SKY 600 0284C7
    define_colour SKY 700 0369A1
    define_colour SKY 800 075985
    define_colour SKY 900 0C4A6E

    define_colour CYAN 50 ECFEFF
    define_colour CYAN 100 CFFAFE
    define_colour CYAN 200 A5F3FC
    define_colour CYAN 300 67E8F9
    define_colour CYAN 400 22D3EE
    define_colour CYAN 500 06B6D4
    define_colour CYAN 600 0891B2
    define_colour CYAN 700 0E7490
    define_colour CYAN 800 155E75
    define_colour CYAN 900 164E63

    define_colour TEAL 50 F0FDFA
    define_colour TEAL 100 CCFBF1
    define_colour TEAL 200 99F6E4
    define_colour TEAL 300 5EEAD4
    define_colour TEAL 400 2DD4BF
    define_colour TEAL 500 14B8A6
    define_colour TEAL 600 0D9488
    define_colour TEAL 700 0F766E
    define_colour TEAL 800 115E59
    define_colour TEAL 900 134E4A

    define_colour EMERALD 50 ECFDF5
    define_colour EMERALD 100 D1FAE5
    define_colour EMERALD 200 A7F3D0
    define_colour EMERALD 300 6EE7B7
    define_colour EMERALD 400 34D399
    define_colour EMERALD 500 10B981
    define_colour EMERALD 600 059669
    define_colour EMERALD 700 047857
    define_colour EMERALD 800 065F46
    define_colour EMERALD 900 064E3B

    define_colour GREEN 50 F0FDF4
    define_colour GREEN 100 DCFCE7
    define_colour GREEN 200 BBF7D0
    define_colour GREEN 300 86EFAC
    define_colour GREEN 400 4ADE80
    define_colour GREEN 500 22C55E
    define_colour GREEN 600 16A34A
    define_colour GREEN 700 15803D
    define_colour GREEN 800 166534
    define_colour GREEN 900 14532D

    define_colour LIME 50 F7FEE7
    define_colour LIME 100 ECFCCB
    define_colour LIME 200 D9F99D
    define_colour LIME 300 BEF264
    define_colour LIME 400 A3E635
    define_colour LIME 500 84CC16
    define_colour LIME 600 65A30D
    define_colour LIME 700 4D7C0F
    define_colour LIME 800 3F6212
    define_colour LIME 900 365314

    define_colour YELLOW 50 FEFCE8
    define_colour YELLOW 100 FEF9C3
    define_colour YELLOW 200 FEF08A
    define_colour YELLOW 300 FDE047
    define_colour YELLOW 400 FACC15
    define_colour YELLOW 500 EAB308
    define_colour YELLOW 600 CA8A04
    define_colour YELLOW 700 A16207
    define_colour YELLOW 800 854D0E
    define_colour YELLOW 900 713F12

    define_colour AMBER 50 FFFBEB
    define_colour AMBER 100 FEF3C7
    define_colour AMBER 200 FDE68A
    define_colour AMBER 300 FCD34D
    define_colour AMBER 400 FBBF24
    define_colour AMBER 500 F59E0B
    define_colour AMBER 600 D97706
    define_colour AMBER 700 B45309
    define_colour AMBER 800 92400E
    define_colour AMBER 900 78350F

    define_colour ORANGE 50 FFF7ED
    define_colour ORANGE 100 FFEDD5
    define_colour ORANGE 200 FED7AA
    define_colour ORANGE 300 FDBA74
    define_colour ORANGE 400 FB923C
    define_colour ORANGE 500 F97316
    define_colour ORANGE 600 EA580C
    define_colour ORANGE 700 C2410C
    define_colour ORANGE 800 9A3412
    define_colour ORANGE 900 7C2D12

    define_colour RED 50 FEF2F2
    
    define_colour RED 100 FEE2E2
    define_colour RED 200 FECACA
    define_colour RED 300 FCA5A5
    define_colour RED 400 F87171
    define_colour RED 500 EF4444
    define_colour RED 600 DC2626
    define_colour RED 700 B91C1C
    define_colour RED 800 991B1B
    define_colour RED 900 7F1D1D

}

define_colours

printf "\t  ${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"