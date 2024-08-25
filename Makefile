CFLAGS = -std=c++17 -O2

LDFLAGS = -lglfw -lvulkan -ldl -lpthread

VulkanTest: *.cpp *.hpp
	g++ $(CFLAGS) -o VulkanTest *.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	./VulkanTest

clean: 
	rm -f VulkanTest
